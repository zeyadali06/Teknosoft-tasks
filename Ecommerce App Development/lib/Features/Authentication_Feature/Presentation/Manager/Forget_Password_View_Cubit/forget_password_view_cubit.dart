import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/Auth_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Check_Network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_view_state.dart';

class ForgetPasswordViewCubit extends Cubit<ForgetPasswordViewState> {
  ForgetPasswordViewCubit() : super(ForgetPasswordViewInitial());

  Future<void> updatePassword(String email) async {
    try {
      emit(ForgetPasswordViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(ForgetPasswordViewFailed("No Internet Connection"));
        return;
      }
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
}
