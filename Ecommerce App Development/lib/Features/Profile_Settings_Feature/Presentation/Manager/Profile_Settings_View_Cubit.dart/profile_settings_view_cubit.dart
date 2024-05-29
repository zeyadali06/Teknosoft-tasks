import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/Auth_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_settings_view_state.dart';

class ProfileSettingsViewCubit extends Cubit<ProfileSettingsViewState> {
  ProfileSettingsViewCubit() : super(ProfileSettingsViewInitial());

  Future<void> changePhone(String phone) async {
    try {
      emit(ProfileSettingsViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ProfileSettingsViewFailed("No Internet Connection"));
        return;
      }
      AuthRepoImplementation.allUserData!.phone = phone;
      await DataBase.updateField(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid, data: AuthRepoImplementation.allUserData!.toMap());
      emit(ProfileSettingsViewPhoneChanged());
    } catch (exc) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(ProfileSettingsViewFailed("No Internet Connection"));
        } else {
          emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
        }
      } catch (_) {}
    }
  }

  Future<void> changePassword(String password) async {
    try {
      emit(ProfileSettingsViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ProfileSettingsViewFailed("No Internet Connection"));
        return;
      }
      await AccountData.updatePassword(password);
      emit(ProfileSettingsViewPasswordChanged());
    } catch (exc) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ProfileSettingsViewFailed("No Internet Connection"));
      } else {
        emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
      }
    }
  }

  Future<void> logout() async {
    try {
      emit(ProfileSettingsViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ProfileSettingsViewFailed("No Internet Connection"));
        return;
      }
      await resetPrefs();
      await FirebaseAuth.instance.signOut();
      AuthRepoImplementation.allUserData = null;
      emit(ProfileSettingsViewExitFromAccount());
    } catch (exc) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(ProfileSettingsViewFailed("No Internet Connection"));
        } else {
          emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
        }
      } catch (_) {}
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(ProfileSettingsViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ProfileSettingsViewFailed("No Internet Connection"));
        return;
      }
      await resetPrefs();
      await resetFirebasefirestore();
      await FirebaseAuth.instance.currentUser!.delete();
      AuthRepoImplementation.allUserData = null;
      emit(ProfileSettingsViewExitFromAccount());
    } catch (exc) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(ProfileSettingsViewFailed("No Internet Connection"));
        } else {
          emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
        }
      } catch (_) {}
    }
  }

  Future<void> resetPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginStatusPrefKey, false);
    await prefs.setString(emailPrefKey, "");
    await prefs.setString(passwordPrefKey, "");
  }

  Future<void> resetFirebasefirestore() async {
    await DataBase.deleteDoc(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid);
    await DataBase.deleteDoc(collectionPath: favourateCollection, docName: AuthRepoImplementation.allUserData!.uid);
    await DataBase.deleteDoc(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid);
  }
}
