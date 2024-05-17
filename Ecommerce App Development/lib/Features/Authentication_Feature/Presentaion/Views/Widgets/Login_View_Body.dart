// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentaion/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentaion/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const LottieImage("assets/images/LottieShoesBlackLine.json"),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Form(
                key: keyForm,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Log In
                    const Text('Login', style: Styles.black21w500),
                    const SizedBox(height: 30),

                    // Email TextField
                    CustomTextFormField(
                      onSaved: (value) {},
                      label: 'Email or Username',
                      hintText: 'Enter Your Email or Username',
                    ),
                    const SizedBox(height: 20),

                    // // Password TextField
                    // CustomTextFormField(
                    //   onSaved: (value) {},
                    //   label: 'Password',
                    //   hintText: 'Enter Your Password',
                    //   obscureText: true,
                    // ),

                    // const SizedBox(height: 10),
                    // CheckboxListTile(
                    //   title: const Text("Remember Me"),
                    //   value: rememberMe,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       rememberMe = newValue!;
                    //     });
                    //   },
                    //   activeColor: purple,
                    //   controlAffinity: ListTileControlAffinity.leading,
                    // ),
                    const SizedBox(height: 30),

                    // Log In Button
                    CustomButton(
                      onPressed: () async {},
                      backgroundColor: kPrimaryColor,
                      buttonText: 'Log In',
                    ),

                    // Sign Up
                    Row(
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppRouter.signUpViewPath));
                          },
                          child: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
