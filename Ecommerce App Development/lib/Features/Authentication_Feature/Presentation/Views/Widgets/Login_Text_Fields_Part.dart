// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Password_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class LoginTextFieldsPart extends StatelessWidget {
  const LoginTextFieldsPart({
    super.key,
    required this.keyForm,
    required this.autovalidateMode,
    required this.emailOrUsernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> keyForm;
  final AutovalidateMode autovalidateMode;
  final TextEditingController emailOrUsernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          Form(
            key: keyForm,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                // Email or Username TextField
                CustomTextFormField(
                  label: 'Email or Username',
                  hintText: 'Enter Your Email or Username',
                  controller: emailOrUsernameController,
                ),
                const SizedBox(height: 20),

                // Password TextField
                CustomObsecureTextFormField(
                  controller: passwordController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
