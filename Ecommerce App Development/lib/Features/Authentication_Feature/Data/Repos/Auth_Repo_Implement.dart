// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/AuthServices.dart';
import 'package:e_commerce_app_development/Core/Utils/FirebaseFirestoreServices.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/RegisterDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImplementation implements AuthRepo {
  @override
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> login(LoginData loginData) async {
    try {
      String? email, uid;
      if (loginData.usingUserName) {
        uid = await AccountData.getUIDFromFirestoreUsingUsername(loginData.username!);
        if (uid == null || uid.isEmpty) {
          return left(AuthFailure(FirebaseAuthException(code: "username-not-found")));
        }
        email = await AccountData.getEmailFromFirestore(uid);
      } else if (loginData.usingemail) {
        uid = await AccountData.getUIDFromFirestoreUsingEmail(loginData.email!);
        if (uid == null || uid.isEmpty) {
          return left(AuthFailure(FirebaseAuthException(code: "user-not-found")));
        }
        email = loginData.email;
      }
      Map<String, dynamic>? data = await AccountData.getUserDataFromFirestore(uid!);
      UserCredential user = await SignIn.signIn(email!, loginData.password!);
      UserData userData = UserData(email: email, username: data!['username'], phone: data['phone'], uid: user.user!.uid);
      return right(AuthCompletedSuccessfully(userData));
    } catch (e) {
      return left(AuthFailure(e));
    }
  }

  @override
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> signUp(SignUpData registerData) async {
    try {
      if (await AccountData.getUIDFromFirestoreUsingUsername(registerData.username) != null) {
        return left(AuthFailure(FirebaseAuthException(code: "username-already-in-use")));
      }

      UserCredential user = await Register.register(registerData.toMap()..remove('password'), registerData.password);
      UserData userData = UserData(email: registerData.email, username: registerData.username, phone: registerData.phone, uid: user.user!.uid);

      await DataBase.setField(collectionPath: favourateCollection, docName: userData.uid, data: {favouratesField: []});

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool(loginStatusPrefKey, false);

      return right(AuthCompletedSuccessfully(userData));
    } catch (e) {
      return left(AuthFailure(e));
    }
  }
}
