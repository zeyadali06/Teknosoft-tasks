// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
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

                // Forget Password Button Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(AppRouter.goTo(context, AppRouter.forgetPasswordViewPath));
                        },
                        child: Text('Forget Passsword!', style: Styles.black14w500.copyWith(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
