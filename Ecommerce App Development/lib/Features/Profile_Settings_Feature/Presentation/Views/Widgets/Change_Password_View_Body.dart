// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Password_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Manager/Profile_Settings_View_Cubit.dart/profile_settings_view_cubit.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileSettingsViewCubit, ProfileSettingsViewState>(
      listener: (context, state) {
        if (state is ProfileSettingsViewLoading) {
          isLoading = true;
          return;
        } else if (state is ProfileSettingsViewPasswordChanged) {
          showSnackBar(context, "Password changed successfully.");
          Navigator.pop(context);
        } else if (state is ProfileSettingsViewFailed) {
          showSnackBar(context, state.errMessage);
        }
        isLoading = false;
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomObsecureTextFormField(
                    controller: controller,
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    onPressed: () async => await BlocProvider.of<ProfileSettingsViewCubit>(context).changePassword(controller.text),
                    buttonText: 'Change',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
