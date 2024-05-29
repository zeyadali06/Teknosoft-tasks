// ignore_for_file: file_names, use_build_context_synchronously

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Phone_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Manager/Forget_Password_View_Cubit/forget_password_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Lottie_Image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewCubit, ForgetPasswordViewState>(
      listener: (context, state) {
        if (state is ForgetPasswordViewEmailSent) {
          showSnackBar(context, "Email Sended Successfully");
          Navigator.of(context).pop();
        } else if (state is ForgetPasswordViewFailed) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Lottie Image
              const LottieImage("assets/images/LottieShoesBlackLine.json"),

              // Find Your Account Text
              const Text('Find Your Account', style: Styles.black21w500),

              Padding(
                padding: const EdgeInsets.all(kPadding),
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

              // Send Email Button
              CustomButton(
                onPressed: onPressed,
                backgroundColor: kPrimaryColor,
                buttonText: 'Send Email',
                width: MediaQuery.of(context).size.width - kPadding * 2,
              ),
            ],
          ),
        );
      },
    );
  }

  void onPressed() async {
    if (keyForm.currentState!.validate()) {
      bool codeSent = false;
      await waitUntilFinished(context, () async {
        codeSent = await BlocProvider.of<ForgetPasswordViewCubit>(context).sendCodeToPhone(emailController.text, phoneController.text);
      });

      if (codeSent) {
        showCodeInputDialog(context);
      }

      if (codeController.text.isNotEmpty && codeController.text == BlocProvider.of<ForgetPasswordViewCubit>(context).verificationId) {
        await waitUntilFinished(context, () async => await BlocProvider.of<ForgetPasswordViewCubit>(context).updatePassword(emailController.text, phoneController.text));
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void showCodeInputDialog(BuildContext context) {
    codeController.text = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text('Enter Code'),
            content: TextField(
              controller: codeController,
              decoration: const InputDecoration(hintText: "Enter the code sent to your phone"),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: Styles.black14w500),
              ),
              ElevatedButton(
                onPressed: () {
                  codeController.text = "";
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel', style: Styles.black14w500),
              ),
            ],
          ),
        );
      },
    );
  }
}
