// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Manager/Profile_Settings_View_Cubit.dart/profile_settings_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Widgets/Profile_Image.dart';
import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Widgets/Settings_List_Tile.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileSettingsViewBody extends StatefulWidget {
  const ProfileSettingsViewBody({super.key});

  @override
  State<ProfileSettingsViewBody> createState() => _ProfileSettingsViewBodyState();
}

class _ProfileSettingsViewBodyState extends State<ProfileSettingsViewBody> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileSettingsViewCubit, ProfileSettingsViewState>(
      listener: (context, state) {
        isLoading = false;
        if (state is ProfileSettingsViewFailed) {
          showSnackBar(context, state.errMessage);
        } else if (state is ProfileSettingsViewAccountDeleted) {
          Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
        } else if (state is ProfileSettingsViewLoggedout) {
          Navigator.of(context).pushReplacement(AppRouter.goTo(context, AppRouter.loginViewPath));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                children: [
                  const ProfileImage(),
                  const Spacer(),
                  SettingsListTile(listTileText: "Change phone number", toView: AppRouter.changePhoneViewPath, icon: Icons.phone_in_talk_rounded),
                  const SizedBox(height: 10),
                  SettingsListTile(listTileText: "Change password", toView: AppRouter.changePasswordViewPath, icon: Icons.lock),
                  const Spacer(),
                  Column(
                    children: [
                      CustomButton(
                        buttonText: "Logout",
                        onPressed: () async {
                          isLoading = true;
                          setState(() {});
                          await BlocProvider.of<ProfileSettingsViewCubit>(context).logout();
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        backgroundColor: Colors.red,
                        fontColor: Colors.white,
                        buttonText: "Delete Account",
                        onPressed: () async {
                          isLoading = true;
                          setState(() {});
                          await BlocProvider.of<ProfileSettingsViewCubit>(context).deleteAccount();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
