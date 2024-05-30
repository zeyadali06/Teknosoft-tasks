// ignore_for_file: file_names, use_build_context_synchronously

import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Forget_Password_View_Cubit/forget_password_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Phone_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Alert_Message.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Timer_Widget.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/formatters.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late bool timeFinished;
  late bool sendCode;
  late int totalSeconds;
  late bool codeSent;
  late bool codeVerified;

  @override
  void initState() {
    timeFinished = false;
    sendCode = true;
    codeSent = false;
    codeVerified = false;
    totalSeconds = 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewCubit, ForgetPasswordViewState>(
      listener: (context, state) async {
        if (state is ForgetPasswordViewEmailSent) {
          showSnackBar(context, "Email sended, Please check your emails");
          Navigator.of(context).pop();
        } else if (state is ForgetPasswordViewCorrectCode) {
          await showAlertMesssge(
              context, 'Enter the code sent to your phone', "Code is verified successfully, Please click on send change password email button to send an email to enter your new password.");
        } else if (state is ForgetPasswordViewFailed) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Lottie Image
                  const LottieImage("assets/images/LottieShoesBlackLine.json"),
                  const Spacer(flex: 3),

                  // Find Your Account Text
                  const Text('Find Your Account', style: Styles.black21w500),
                  const Spacer(flex: 3),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding),
                    child: Form(
                      key: keyForm,
                      autovalidateMode: autovalidateMode,
                      child: Column(
                        children: [
                          // Email TextField
                          CustomTextFormField(hintText: "Email", label: "Email", controller: emailController),
                          const SizedBox(height: 20),

                          // Phone TextField
                          CustomPhoneTextField(controller: phoneController),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),

                  if (!sendCode)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Enter Code
                        if (!codeVerified)
                          Row(
                            children: [
                              CustomButton(
                                onPressed: () => showCodeInputDialog(context),
                                buttonText: "Enter Code",
                                width: 100,
                              ),
                              const SizedBox(width: 30),
                            ],
                          ),

                        Column(
                          children: [
                            if (!timeFinished)
                              Column(
                                children: [
                                  const Text("Resend Code", style: Styles.black18w500),

                                  // Timer
                                  TimerWidget(
                                    totalSeconds: totalSeconds,
                                    fontSize: 18,
                                    afterFinished: () {
                                      timeFinished = true;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              )
                            else
                              // Resend Code Button
                              CustomButton(
                                onPressed: () {
                                  if (timeFinished) {
                                    timeFinished = false;
                                    if (BlocProvider.of<ForgetPasswordViewCubit>(context).attempts >= 3) {
                                      totalSeconds = 30 * 60;
                                    } else {
                                      totalSeconds += 60;
                                    }
                                    setState(() {});
                                    sendVerificationCode();
                                  }
                                },
                                buttonText: "Resend Code",
                                width: 100,
                              ),
                          ],
                        ),
                      ],
                    ),
                  const Spacer(flex: 1),

                  // Send SMS Or Email Button
                  CustomButton(
                    onPressed: sendCode ? sendVerificationCode : sendEmail,
                    backgroundColor: kPrimaryColor,
                    buttonText: sendCode ? 'Send SMS Code' : 'Send Change Password Email',
                    width: MediaQuery.of(context).size.width - kPadding * 2,
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void sendVerificationCode() async {
    if (keyForm.currentState!.validate()) {
      codeSent = false;
      await waitUntilFinished(context, () async {
        codeSent = await BlocProvider.of<ForgetPasswordViewCubit>(context).sendCodeToPhone(emailController.text, phoneController.text);
      });
      if (codeSent) {
        sendCode = false;
        codeVerified = false;
        setState(() {});
        showCodeInputDialog(context);
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void sendEmail() async {
    if (keyForm.currentState!.validate()) {
      if (codeController.text.isNotEmpty && codeVerified) {
        await waitUntilFinished(context, () async => await BlocProvider.of<ForgetPasswordViewCubit>(context).updatePassword(emailController.text, phoneController.text));
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  Future<T?> showCodeInputDialog<T>(BuildContext context) async {
    codeController.text = "";
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text('Enter the code sent to your phone'),
            content: CustomTextFormField(
              label: "",
              hintText: "",
              controller: codeController,
              inputFormatters: [Formatters.numbersOnly],
            ),
            actions: <Widget>[
              CustomButton(
                width: 50,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                onPressed: () async {
                  Navigator.of(context).pop();
                  codeVerified = await BlocProvider.of<ForgetPasswordViewCubit>(context).verifyCode(codeController.text);
                },
                buttonText: 'OK',
              ),
              CustomButton(
                width: 50,
                onPressed: () {
                  codeController.text = "";
                  Navigator.of(context).pop();
                },
                buttonText: 'Cancel',
              ),
            ],
          ),
        );
      },
    );
    return null;
  }
}
