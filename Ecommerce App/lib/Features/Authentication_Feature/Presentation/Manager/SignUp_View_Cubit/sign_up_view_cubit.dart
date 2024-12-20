import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Fauiler.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Models/User_Data_Model/SignUpDataModel.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_view_state.dart';

class SignUpViewCubit extends Cubit<SignUpViewState> {
  SignUpViewCubit(this.authRepo) : super(SignUpViewInitial());

  final AuthRepo authRepo;

  Future<void> register(SignUpData signUpData) async {
    try {
      emit(SignUpViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(SignUpViewFailed("No Internet Connection"));
        return;
      }
      Either<AuthFailure, AuthCompletedSuccessfully> res = await authRepo.signUp(signUpData);
      res.fold((failure) {
        emit(SignUpViewFailed(failure.errMessage));
      }, (success) {
        emit(SignUpViewSuccessed());
      });
    } catch (e) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(SignUpViewFailed("No Internet Connection"));
        } else {
          emit(SignUpViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
  }
}
