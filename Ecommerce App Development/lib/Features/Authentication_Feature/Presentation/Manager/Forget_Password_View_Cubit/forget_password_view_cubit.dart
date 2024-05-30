import 'dart:developer';

import 'package:e_commerce_app_development/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app_development/Core/Utils/Auth_Services.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'forget_password_view_state.dart';

class ForgetPasswordViewCubit extends Cubit<ForgetPasswordViewState> {
  ForgetPasswordViewCubit() : super(ForgetPasswordViewInitial());

  String verificationId = "1234";
  int attempts = 0;

  Future<void> updatePassword(String email, String phone) async {
    try {
      emit(ForgetPasswordViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
        return;
      }

      await AccountData.resetPassword(email);

      emit(ForgetPasswordViewEmailSent());
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
      } else if (e is AuthFailure) {
        emit(ForgetPasswordViewFailed(e.errMessage));
      } else {
        emit(ForgetPasswordViewFailed(AuthFailure(e).errMessage));
      }
    }
  }

  Future<bool> verifyCode(String code) async {
    try {
      emit(ForgetPasswordViewLoading());

      if (code.isEmpty && code.length == 6) {
        emit(ForgetPasswordViewFailed("Incorrect Code"));
        return false;
      }
      if (verificationId.isEmpty) {
        emit(ForgetPasswordViewFailed("You should send code first"));
        return false;
      }
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
        return false;
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseAuth.instance.signOut();

      emit(ForgetPasswordViewCorrectCode());
      return true;
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
      } else if (e is AuthFailure) {
        emit(ForgetPasswordViewFailed(e.errMessage));
      } else {
        emit(ForgetPasswordViewFailed(AuthFailure(e).errMessage));
      }
    }

    return false;
  }

  Future<bool> sendCodeToPhone(String email, String phone) async {
    try {
      if (attempts >= 3) {
        emit(ForgetPasswordViewFailed("Many attempts, try again later"));
        return false;
      }

      emit(ForgetPasswordViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
        return false;
      }

      var doc = await FirebaseFirestore.instance.collection(usersCollection).where("email", isEqualTo: email).where("phone", isEqualTo: phone).get();
      if (doc.docs.isEmpty) {
        emit(ForgetPasswordViewFailed("Please, enter correct data"));
        return false;
      }

      bool codeSent = true;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          log('ok1');
        },
        verificationFailed: (FirebaseAuthException authException) {
          codeSent = false;
          log(authException.message.toString());
        },
        codeSent: (String vid, int? forceResendingToken) {
          verificationId = vid;
          log('ok3    $vid');
        },
        codeAutoRetrievalTimeout: (String vid) {
          verificationId = vid;
          log('ok4     $vid');
        },
      );
      if (!codeSent) {
        emit(ForgetPasswordViewFailed("Error"));
      } else {
        attempts++;
      }
      return codeSent;
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
      } else if (e is AuthFailure) {
        emit(ForgetPasswordViewFailed(e.errMessage));
      } else {
        emit(ForgetPasswordViewFailed(AuthFailure(e).errMessage));
      }
    }
    return false;
  }
}
