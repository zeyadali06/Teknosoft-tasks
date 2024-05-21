import 'package:e_commerce_app_development/Core/Utils/AuthServices.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:e_commerce_app_development/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_view_state.dart';

class SplashViewCubit extends Cubit<SplashViewState> {
  SplashViewCubit() : super(SplashViewInitial());

  Future<bool> checkLoginStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(loginStatusPrefKey) == true) {
        if (prefs.getString(emailPrefKey) != "") {
          String? uid = await AccountData.getUIDFromFirestoreUsingEmail(prefs.getString(emailPrefKey)!);
          Map<String, dynamic>? data = await AccountData.getUserDataFromFirestore(uid!);
          allUserData = UserData(email: data!['email'], phone: data['phone'], uid: data['uid'], username: data['username']);
          return true;
        }
      }
    } catch (_) {}
    return false;
  }
}
