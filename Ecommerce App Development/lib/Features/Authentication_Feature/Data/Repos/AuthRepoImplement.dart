// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/AuthServices.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/RegisterDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/AuthRepo.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      await SignIn.signIn(email!, loginData.password);
      return right(AuthCompletedSuccessfully());
    } catch (e) {
      return left(AuthFailure(e));
    }
  }

  @override
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> register(RegisterData registerData) async {
    try {
      if (await AccountData.getUIDFromFirestoreUsingUsername(registerData.username) != null) {
        return left(AuthFailure(FirebaseAuthException(code: "username-already-in-use")));
      }
      await Register.register(registerData.toMap()..remove('password'), registerData.password);
      return right(AuthCompletedSuccessfully());
    } catch (e) {
      return left(AuthFailure(e));
    }
  }

  @override
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> signInWithGoogle() async {
    try {
      await SignIn.signInWithGoogle();
      return right(AuthCompletedSuccessfully());
    } catch (e) {
      return left(AuthFailure(e));
    }
  }
}
