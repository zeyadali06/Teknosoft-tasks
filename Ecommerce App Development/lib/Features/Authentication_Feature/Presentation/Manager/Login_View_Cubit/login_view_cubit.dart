import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit(this.authRepo) : super(LoginViewInitial());

  final AuthRepo authRepo;

  Future<void> login(LoginData loginData) async {
    try {
      emit(LoginViewLoading());
      Either<AuthFailure, AuthCompletedSuccessfully> res = await authRepo.login(loginData);
      res.fold((failure) {
        emit(LoginViewFailed(failure.errMessage));
      }, (r) {
        emit(LoginViewSuccessed(r.userData));
      });
    } catch (e) {
      try {
        emit(LoginViewFailed(AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }

  Future<void> setPrefs(bool loggedin, String? email, String? password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(loginStatusPrefKey, loggedin);
      if (email != null) {
        await prefs.setString(emailPrefKey, email);
      }
      if (password != null) {
        await prefs.setString(passwordPrefKey, password);
      }
    } catch (e) {
      emit(LoginViewFailed(AuthFailure(e).errMessage));
    }
  }
}
