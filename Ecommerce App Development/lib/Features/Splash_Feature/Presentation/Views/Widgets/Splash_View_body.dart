// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Splash_Feature/Presentation/Manager/cubit/splash_view_cubit.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool navigated = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _getData();
  }

  Future<void> _getData() async {
    bool loggedIn = await BlocProvider.of<SplashViewCubit>(context).checkLoginStatus();
    if (!loggedIn) {
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
      });
      return;
    }
    List<ProductModel> products = await BlocProvider.of<ShoppingViewCubit>(context).getAllProducts();
    BlocProvider.of<ShoppingViewCubit>(context).getAvaliableProducts(products);
    BlocProvider.of<ShoppingViewCubit>(context).getBrands(products);
    BlocProvider.of<ShoppingViewCubit>(context).getSpecificBrandProducts(products, "All");
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.navigationBarPath));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieImage("assets/images/LottieShoesRed.json", reverse: false),
            SizedBox(height: 20),
            CircularProgressIndicator(color: kPrimaryColor),
          ],
        ),
      ),
    );
  }
}
