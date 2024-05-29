// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Manager/Profile_Settings_View_Cubit.dart/profile_settings_view_cubit.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Phone_Text_Form_Field.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ChangePhoneViewBody extends StatefulWidget {
  const ChangePhoneViewBody({super.key});

  @override
  State<ChangePhoneViewBody> createState() => _ChangePhoneViewBodyState();
}

class _ChangePhoneViewBodyState extends State<ChangePhoneViewBody> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileSettingsViewCubit, ProfileSettingsViewState>(
      listener: (context, state) {
        if (state is ProfileSettingsViewPhoneChanged) {
          showSnackBar(context, "Phone changed successfully.");
          Navigator.pop(context);
        } else if (state is ProfileSettingsViewFailed) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPhoneTextField(controller: controller),
                const SizedBox(height: 50),
                CustomButton(
                  onPressed: () async {
                    await waitUntilFinished(context, () async => await BlocProvider.of<ProfileSettingsViewCubit>(context).changePhone(controller.text));
                  },
                  buttonText: 'Change',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
