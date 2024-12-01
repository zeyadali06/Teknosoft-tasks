import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, [int seconds = 2]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Styles.black18w500(context),
    ),
    duration: Duration(seconds: seconds),
    backgroundColor: kPrimaryColor,
  ));
}
