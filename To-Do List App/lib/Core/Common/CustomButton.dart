// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      color: kPrimaryColor,
      padding: const EdgeInsets.all(15),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(kRaduis), borderSide: const BorderSide(width: 0, color: kPrimaryColor)),
      child: Text('Add New Task', style: Styles.blue18Bold.copyWith(color: Colors.white)),
    );
  }
}
