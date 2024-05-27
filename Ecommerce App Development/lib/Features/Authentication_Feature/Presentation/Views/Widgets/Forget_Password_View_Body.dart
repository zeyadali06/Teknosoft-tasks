// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Forget_Password_Text_Fields_Part.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Lottie Image
            const LottieImage("assets/images/LottieShoesBlackLine.json"),

            // Find Your Account Text
            const Text('Find Your Account', style: Styles.black21w500),

            // forget password text fields
            ForgetPasswordTextFieldsPart(
              keyForm: keyForm,
              autovalidateMode: autovalidateMode,
              emailController: emailController,
              passwordController: passwordController,
            ),

            // Save Button
            CustomButton(
              onPressed: onPressed,
              backgroundColor: kPrimaryColor,
              buttonText: 'Save',
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() async {
    if (keyForm.currentState!.validate()) {
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
