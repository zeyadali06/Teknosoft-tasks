// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Login_View_Cubit/login_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Password_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LottieImage("assets/images/LottieShoesBlackLine.json"),
                Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    children: [
                      Form(
                        key: keyForm,
                        child: Column(
                          children: [
                            // Login Text
                            const Text('Login', style: Styles.black21w500),
                            const SizedBox(height: 40),

                            // Email or Username TextField
                            CustomTextFormField(
                              onSaved: (value) {},
                              label: 'Email or Username',
                              hintText: 'Enter Your Email or Username',
                            ),
                            const SizedBox(height: 15),

                            // Password TextField
                            CustomPasswordTextFormField(
                              onSaved: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Login Button
                Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    children: [
                      CustomButton(
                        onPressed: () async {
                          LoginData loginData = LoginData(usernameOrEmail: emailController.text, password: passwordController.text);
                          BlocProvider.of<LoginViewCubit>(context).login(loginData);
                        },
                        backgroundColor: kPrimaryColor,
                        buttonText: 'Login',
                      ),

                      // SignUp TextButton
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.signUpViewPath));
                            },
                            child: const Text('SignUp', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
