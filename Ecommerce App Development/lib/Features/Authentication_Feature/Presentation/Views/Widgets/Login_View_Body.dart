// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Login_View_Cubit/login_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Login_Text_Fields_Part.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:e_commerce_app_development/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewCubit, LoginViewState>(
      listener: (context, state) async {
        if (state is LoginViewLoading) {
          isLoading = true;
          return;
        } else if (state is LoginViewSuccessed) {
          await BlocProvider.of<LoginViewCubit>(context).setPrefs(true, state.userData.email, passwordController.text);
          allUserData = state.userData;
          Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.splashViewPath));
        } else if (state is LoginViewFailed) {
          showSnackBar(context, state.errMessage);
        }
        isLoading = false;
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const LottieImage("assets/images/LottieShoesBlackLine.json"),

                      // Login Text
                      const Text('Login', style: Styles.black21w500),

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
          ),
        );
      },
    );
  }

  void onPressed() async {
    if (keyForm.currentState!.validate()) {
      LoginData loginData = LoginData(usernameOrEmail: emailOrUsernameController.text, password: passwordController.text);
      await BlocProvider.of<LoginViewCubit>(context).login(loginData);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
