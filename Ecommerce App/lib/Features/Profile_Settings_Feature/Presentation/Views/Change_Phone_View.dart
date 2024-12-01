import 'package:e_commerce_app/Features/Profile_Settings_Feature/Presentation/Views/Widgets/Change_Phone_View_Body.dart';
import 'package:flutter/material.dart';

class ChangePhoneView extends StatelessWidget {
  const ChangePhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ChangePhoneViewBody(),
    );
  }
}
