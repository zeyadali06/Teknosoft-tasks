// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/AuthRepoImplement.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Login_View_Cubit/login_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/SignUp_View_Cubit/sign_up_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Login_View.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/SignUp_View.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Cart_View.dart';
import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentation/Views/Favourate_View.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Product_Details_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Manager/Profile_Settings_View_Cubit.dart/profile_settings_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Change_Password_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Change_Phone_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Profile_Settings_View.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Product_Item_Cubit.dart/product_item_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Shopping_View.dart';
import 'package:e_commerce_app_development/Features/Splash_Feature/Presentation/Manager/cubit/splash_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Splash_Feature/Presentation/Views/Splash_View.dart';
import 'package:e_commerce_app_development/Navigation_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Widget navigationBarPath = const CustomNavigationBar();

  static Widget splashViewPath = BlocProvider(
    create: (context) => SplashViewCubit(),
    child: const SplashView(),
  );

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

  static Widget profileSettingsViewPath = const ProfileSettingsView();

  static Widget changePhoneViewPath = const ChangePhoneView();

  static Widget changePasswordViewPath = const ChangePasswordView();

  static Widget fromMaterial = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ShoppingViewCubit(ShoppingRepoImplement()),
      ),
      BlocProvider(
        create: (context) => ProfileSettingsViewCubit(),
      ),
      BlocProvider(
        create: (context) => ProductItemCubit(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppRouter.splashViewPath,
    ),
  );

  static MaterialPageRoute goTo(BuildContext context, Widget toView) {
    return MaterialPageRoute(builder: (context) {
      return toView;
    });
  }
}
