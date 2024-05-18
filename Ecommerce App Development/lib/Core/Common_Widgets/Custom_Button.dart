// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.fontColor = Colors.black,
    this.backgroundColor = kPrimaryColor,
  });

  final void Function()? onPressed;
  final String buttonText;
  final Color fontColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      color: backgroundColor,
      height: 45,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(kRadius), borderSide: BorderSide(width: 0, color: backgroundColor)),
      child: Text(buttonText, style: Styles.black18w500.copyWith(color: fontColor)),
    );
  }
}
