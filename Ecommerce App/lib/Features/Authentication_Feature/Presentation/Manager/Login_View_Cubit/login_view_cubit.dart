import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Fauiler.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app/constants.dart';
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
      bool connStat = await checkConn();
      if (!connStat) {
        emit(LoginViewFailed("No Internet Connection"));
        return;
      }
      Either<AuthFailure, AuthCompletedSuccessfully> res = await authRepo.login(loginData);
      res.fold((failure) {
        throw failure;
      }, (r) {
        AuthRepoImplementation.allUserData = r.userData;
      });
      await setPrefs(true, AuthRepoImplementation.allUserData!.email, loginData.password);
      emit(LoginViewSuccessed(AuthRepoImplementation.allUserData!));
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(LoginViewFailed("No Internet Connection"));
      } else if (e is AuthFailure) {
        emit(LoginViewFailed(e.errMessage));
      } else {
        emit(LoginViewFailed(AuthFailure(e).errMessage));
      }
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
    } catch (_) {}
  }
}
