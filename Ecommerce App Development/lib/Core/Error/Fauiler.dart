// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class AuthFailure implements Failure {
  late String _message;
  AuthFailure(Object e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'weak-password') {
        _message = 'Password should be at least 6 characters';
      } else if (e.code == 'email-already-in-use') {
        _message = 'Email already exist';
      } else if (e.code == 'username-already-in-use') {
        _message = 'Username already exist';
      } else if (e.code == 'wrong-confirmation') {
        _message = "Password and it's confirmation dosen't same";
      } else if (e.code == 'invalid-email') {
        _message = 'Invalid Email';
      } else if (e.code == 'network-request-failed') {
        _message = 'No Internet Connection';
      } else if (e.code == 'user-not-found') {
        _message = 'Email not found';
      } else if (e.code == 'username-not-found') {
        _message = 'Username not found';
      } else if (e.code == 'too-many-requests') {
        _message = 'Too many attempts, Try again later';
      } else if (e.code == 'wrong-password') {
        _message = 'Wrong password';
      } else if (e.code == 'invalid-credential') {
        _message = 'Error, Please enter correct data';
      } else if (e.code == "requires-recent-login") {
        _message = 'Make this operation after recent login';
      } else {
        _message = 'Error try again later';
      }
    } else {
      _message = 'Error try again later';
    }
  }

  @override
  String get errMessage => _message;
}
