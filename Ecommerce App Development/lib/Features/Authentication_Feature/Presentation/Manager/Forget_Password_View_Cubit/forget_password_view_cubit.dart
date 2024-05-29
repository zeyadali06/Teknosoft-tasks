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

  late String _verificationId;

  Future<void> updatePassword(String email, String phone) async {
    try {
      emit(ForgetPasswordViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
        return;
      }

      var doc = await FirebaseFirestore.instance.collection(usersCollection).where("email", isEqualTo: email).where("phone", isEqualTo: phone).get();
      if (doc.docs.isEmpty) {
        emit(ForgetPasswordViewFailed("Please, enter correct data"));
        return;
      }

      await _sendCodeToPhoneNumber("01024855010");

      await AccountData.resetPassword(email);

      emit(ForgetPasswordViewSuccessed());
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

  Future<void> _sendCodeToPhoneNumber(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 10),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        // await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException authException) {
        print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        print('Please check your phone for the verification code.');
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }
}
