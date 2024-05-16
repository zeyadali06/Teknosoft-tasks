// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentaion/Views/Login_View.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentaion/Views/Signup_View.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentaion/Views/Cart_View.dart';
import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentaion/Views/Favourate_View.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentaion/Views/Product_Details_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentaion/Views/Profile_Settings_View.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentaion/Views/Shopping_View.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const Widget loginViewPath = LoginView();
  static const Widget signUpViewPath = SignUpView();
  static const Widget shoppingViewPath = ShoppingView();
  static const Widget cartViewPath = CartView();
  static const Widget favourateViewPath = FavourateView();
  static const Widget productDetailsViewPath = ProductDetailsView();
  static const Widget profileSettingsViewPath = ProfileSettingsView();
}
