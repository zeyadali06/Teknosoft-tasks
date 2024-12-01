import 'package:e_commerce_app/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app/Core/Utils/Auth_Services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'splash_view_state.dart';

class SplashViewCubit extends Cubit<SplashViewState> {
  SplashViewCubit() : super(SplashViewInitial());

  Future<bool> checkLoginStatus() async {
    try {
      bool connStat = await checkConn();
      if (!connStat) {
        return false;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(loginStatusPrefKey) == true) {
        if (prefs.getString(emailPrefKey) != "") {
          String? uid = await AccountData.getUIDFromFirestoreUsingEmail(prefs.getString(emailPrefKey)!);
          Map<String, dynamic>? data = await AccountData.getUserDataFromFirestore(uid!);
          AuthRepoImplementation.allUserData = UserData(email: data!['email'], phone: data['phone'], uid: data['uid'], username: data['username'], profileURL: data['profileURL']);
          return true;
        }
      }
    } catch (_) {
      bool connStat = await checkConn();
      if (!connStat) {
        return false;
      }
    }
    return false;
  }
}
