import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Views/Widgets/Change_Password_View_Body.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ChangePasswordViewBody(),
    );
  }
}
