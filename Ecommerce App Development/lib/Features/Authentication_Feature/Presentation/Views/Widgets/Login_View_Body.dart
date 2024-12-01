// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Login_View_Cubit/login_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Login_Text_Fields_Part.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailOrUsernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewCubit, LoginViewState>(
      listener: (context, state) {
        if (state is LoginViewSuccessed) {
          Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.splashViewPath));
        } else if (state is LoginViewFailed) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: const LottieImage("assets/images/BagAnimation.json", seconds: 7),
                    ),

                    // Login Text
                    Text('Login', style: Styles.black21w500(context)),

                    // login text fields
                    LoginTextFieldsPart(
                      keyForm: keyForm,
                      autovalidateMode: autovalidateMode,
                      emailOrUsernameController: emailOrUsernameController,
                      passwordController: passwordController,
                    ),

                    // Login Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding),
                      child: Column(
                        children: [
                          CustomButton(
                            onPressed: onPressed,
                            backgroundColor: kPrimaryColor,
                            buttonText: 'Login',
                          ),

                          // SignUp TextButton
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?", style: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14))),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.signUpViewPath));
                                },
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
                                ),
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
      },
    );
  }

  void onPressed() async {
    if (keyForm.currentState!.validate()) {
      LoginData loginData = LoginData(usernameOrEmail: emailOrUsernameController.text, password: passwordController.text);
      await waitUntilFinished(context, () async => await BlocProvider.of<LoginViewCubit>(context).login(loginData));
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
