import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/AuthRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit(this.authRepo) : super(LoginViewInitial());

  final AuthRepo authRepo;

  Future<void> login(LoginData loginData) async {
    emit(LoginViewLoading());
    Either<AuthFailure, AuthCompletedSuccessfully> res = await authRepo.login(loginData);
    res.fold((failure) {
      emit(LoginViewFailed(failure.errMessage));
    }, (r) {
      emit(LoginViewSuccessed());
    });
  }
}
