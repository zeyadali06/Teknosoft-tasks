// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/constants.dart';

void showSnakeBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        message,
        style: Styles.blue18Bold.copyWith(color: Colors.white),
      ),
    ),
  );
}
