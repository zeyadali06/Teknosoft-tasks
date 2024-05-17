// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/AuthRepoImplement.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Login_View_Cubit/login_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/SignUp_View_Cubit/sign_up_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Login_View.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/SignUp_View.dart';
import 'package:e_commerce_app_development/Features/Splash_Feature/Presentation/Views/Splash_View.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Cart_View.dart';
import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentation/Views/Favourate_View.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Product_Details_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Profile_Settings_View.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Shopping_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static const Widget splashViewPath = SplashView();
  static Widget loginViewPath = BlocProvider(
    create: (context) => LoginViewCubit(AuthRepoImplementation()),
    child: const LoginView(),
  );
  static Widget signUpViewPath = BlocProvider(
    create: (context) => SignUpViewCubit(AuthRepoImplementation()),
    child: const SignUpView(),
  );
  static const Widget shoppingViewPath = ShoppingView();
  static const Widget cartViewPath = CartView();
  static const Widget favourateViewPath = FavourateView();
  static const Widget productDetailsViewPath = ProductDetailsView();
  static const Widget profileSettingsViewPath = ProfileSettingsView();

  static MaterialPageRoute goTo(BuildContext context, Widget toView) {
    return MaterialPageRoute(builder: (context) {
      return toView;
    });
  }
}
