// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Password_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTextFieldsPart extends StatelessWidget {
  const ForgetPasswordTextFieldsPart({super.key, required this.keyForm, required this.autovalidateMode, required this.emailController, required this.passwordController});

  final GlobalKey<FormState> keyForm;
  final AutovalidateMode autovalidateMode;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          // email text field
          CustomTextFormField(hintText: "Email", label: "Email", controller: emailController),

          const SizedBox(height: 20),

          // password text field
          CustomObsecureTextFormField(controller: passwordController),
        ],
      ),
    );
  }
}
