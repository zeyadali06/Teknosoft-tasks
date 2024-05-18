import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/FirebaseFirestoreServices.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:e_commerce_app_development/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_settings_view_state.dart';

class ProfileSettingsViewCubit extends Cubit<ProfileSettingsViewState> {
  ProfileSettingsViewCubit() : super(ProfileSettingsViewInitial());

  Future<void> changePhone(String phone) async {
    try {
      allUserData!.phone = phone;
      await DataBase.updateField(collectionPath: usersCollection, docName: allUserData!.uid, data: allUserData!.toMap());
      emit(ProfileSettingsViewPhoneChanged());
    } catch (exc) {
      emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
    }
  }

  Future<void> changePassword(String password) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
      emit(ProfileSettingsViewPasswordChanged());
    } catch (exc) {
      emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(loginStatusPrefKey, false);
      await FirebaseAuth.instance.signOut();
      allUserData = null;
      emit(ProfileSettingsViewLoggedout());
    } catch (exc) {
      emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
    }
  }

  Future<void> deleteAccount() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(loginStatusPrefKey, false);
      await DataBase.deleteDoc(collectionPath: usersCollection, docName: allUserData!.uid);
      await FirebaseAuth.instance.currentUser!.delete();
      allUserData = null;
      emit(ProfileSettingsViewAccountDeleted());
    } catch (exc) {
      emit(ProfileSettingsViewFailed(AuthFailure(exc).errMessage));
    }
  }
}
