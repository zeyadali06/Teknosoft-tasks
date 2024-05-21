import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/RegisterDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_view_state.dart';

class SignUpViewCubit extends Cubit<SignUpViewState> {
  SignUpViewCubit(this.authRepo) : super(SignUpViewInitial());

  final AuthRepo authRepo;

  Future<void> register(SignUpData signUpData) async {
    try {
      emit(SignUpViewLoading());
      Either<AuthFailure, AuthCompletedSuccessfully> res = await authRepo.signUp(signUpData);
      res.fold((failure) {
        emit(SignUpViewFailed(failure.errMessage));
      }, (success) {
        emit(SignUpViewSuccessed());
      });
    } catch (e) {
      try {
        emit(SignUpViewFailed(AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }
}
