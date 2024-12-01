// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/SignUp_View_Cubit/sign_up_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/SignUp_Text_Fields_Part.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/SignUpDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpViewCubit, SignUpViewState>(
      listener: (context, state) {
        if (state is SignUpViewSuccessed) {
          Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.splashViewPath));
        } else if (state is SignUpViewFailed) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // lottie image
                    const LottieImage("assets/images/LottieShoesBlackLine.json"),

                    // register keyword
                    Text('Register', style: Styles.black21w500(context)),

                    // signup text fields
                    SignUpTextFieldsPart(
                      formKey: formKey,
                      autovalidateMode: autovalidateMode,
                      usernameController: usernameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding),
                      child: Column(
                        children: [
                          // signup button
                          CustomButton(
                            backgroundColor: kPrimaryColor,
                            buttonText: "SignUp",
                            onPressed: onPressed,
                          ),

                          // already have an account text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
                                },
                                child: Text(
                                  'Login',
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

  Future<void>? onPressed() async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        showSnackBar(context, "Wrong Password Confirmation");
        return;
      }
      SignUpData signUpData = SignUpData(
        email: emailController.text,
        username: usernameController.text,
        phone: phoneController.text,
        password: passwordController.text,
      );
      await waitUntilFinished(context, () async => await BlocProvider.of<SignUpViewCubit>(context).register(signUpData));
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
