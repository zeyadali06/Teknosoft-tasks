// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/ImportantStar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';

class CreateNewTaskViewAppBar {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xfff5f6fc),
      elevation: 0,
      title: const Text('Add Task', style: Styles.black20Bold),
      centerTitle: true,
      actions: const [
        ImportantStar(),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
