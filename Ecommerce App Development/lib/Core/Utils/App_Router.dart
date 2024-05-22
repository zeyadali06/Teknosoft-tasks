// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Login_View_Cubit/login_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/SignUp_View_Cubit/sign_up_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Login_View.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/SignUp_View.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Presentation/Views/Cart_View.dart';
import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentation/Views/Favourate_View.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Manager/Product_Details_Cubit/product_details_cubit.dart';
import 'package:e_commerce_app_development/Features/Product_Details_Feature/Presentation/Views/Product_Details_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Manager/Profile_Settings_View_Cubit.dart/profile_settings_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Change_Password_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Change_Phone_View.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Profile_Settings_View.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Product_Item_Cubit.dart/product_item_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Shopping_View.dart';
import 'package:e_commerce_app_development/Features/Splash_Feature/Presentation/Manager/cubit/splash_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Splash_Feature/Presentation/Views/Splash_View.dart';
import 'package:e_commerce_app_development/Navigation_Bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static final AuthRepoImplementation authRepo = AuthRepoImplementation();
  static final ShoppingRepoImplement shoppingRepo = ShoppingRepoImplement();

  static final Widget splashViewPath = BlocProvider(
    create: (context) => SplashViewCubit(),
    child: const SplashView(),
  );

  static final Widget loginViewPath = BlocProvider(
    create: (context) => LoginViewCubit(authRepo),
    child: const LoginView(),
  );

  static final Widget signUpViewPath = BlocProvider(
    create: (context) => SignUpViewCubit(authRepo),
    child: const SignUpView(),
  );

  static const Widget cartViewPath = CartView();

  static final Function(ProductModel product) productDetailsViewPath = (product) => BlocProvider(
        create: (context) => ProductDetailsCubit(),
        child: ProductDetailsView(product: product),
      );

  static final Widget fromMaterial = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ShoppingViewCubit(shoppingRepo),
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

  static const Widget navigationBarPath = CustomNavigationBar();
  static const Widget shoppingViewPath = ShoppingView();
  static const Widget favourateViewPath = FavourateView();
  static const Widget profileSettingsViewPath = ProfileSettingsView();
  static const Widget changePhoneViewPath = ChangePhoneView();
  static const Widget changePasswordViewPath = ChangePasswordView();

  static MaterialPageRoute goTo(BuildContext context, Widget toView) {
    return MaterialPageRoute(builder: (context) {
      return toView;
    });
  }
}
