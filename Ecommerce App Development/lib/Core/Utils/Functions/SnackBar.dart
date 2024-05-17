// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Styles.black18w500,
    ),
    backgroundColor: kPrimaryColor,
  ));
}
