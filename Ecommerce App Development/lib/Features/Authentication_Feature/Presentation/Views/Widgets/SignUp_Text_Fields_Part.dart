// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Phone_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Core/Utils/formatters.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Password_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class SignUpTextFieldsPart extends StatelessWidget {
  const SignUpTextFieldsPart({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.usernameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            // username field
            CustomTextFormField(
              controller: usernameController,
              hintText: 'Username',
              label: 'Username',
              inputFormatters: [Formatters.preventSpaces, Formatters.usernamesRegExp, Formatters.limitInput(25)],
            ),
            const SizedBox(height: 10),

            // email field
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              label: 'Email',
              inputFormatters: [Formatters.preventSpaces, Formatters.emailRegExp],
            ),
            const SizedBox(height: 10),

            // phone field
            CustomPhoneTextField(controller: phoneController),
            const SizedBox(height: 10),

            // passowrd field
            CustomObsecureTextFormField(controller: passwordController),
            const SizedBox(height: 10),

            // confirm passowrd field
            CustomObsecureTextFormField(controller: confirmPasswordController),
          ],
        ),
      ),
    );
  }
}
