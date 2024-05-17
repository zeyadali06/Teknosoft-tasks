import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_view_state.dart';

class SplashViewCubit extends Cubit<SplashViewState> {
  SplashViewCubit() : super(SplashViewInitial());

  Future<void> getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (prefs.getBool(loginStatusPrefKey) != null && prefs.getBool(loginStatusPrefKey) == true) {
        emit(SplashViewSuccess(prefs.getBool(loginStatusPrefKey)!, prefs.getString(emailPrefKey), prefs.getString(passwordPrefKey)));
      } else {
        emit(SplashViewSuccess(false, null, null));
      }
    } catch (_) {
      emit(SplashViewFailed("Error"));
    }
  }

  
}
