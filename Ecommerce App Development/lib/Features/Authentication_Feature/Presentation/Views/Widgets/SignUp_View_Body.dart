// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/RegisterDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/SignUp_View_Cubit/sign_up_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/SignUp_Text_Fields_Part.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool isLoading = false;

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
        if (state is SignUpViewLoading) {
          isLoading = true;
        } else if (state is SignUpViewSuccessed) {
          isLoading = false;
          Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
        } else if (state is SignUpViewFailed) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(color: kPrimaryColor),
          child: SafeArea(
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
                      const Text('Register', style: Styles.black21w500),

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
                                const Text("Already have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
                                  },
                                  child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor)),
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
      await BlocProvider.of<SignUpViewCubit>(context).register(signUpData);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
