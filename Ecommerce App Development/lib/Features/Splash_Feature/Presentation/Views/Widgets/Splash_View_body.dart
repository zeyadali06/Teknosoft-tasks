// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
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
