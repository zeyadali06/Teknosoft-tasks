// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentaion/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 50),
          const LottieImage(path: "assets/images/LottieShoesBlackLine.json"),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
