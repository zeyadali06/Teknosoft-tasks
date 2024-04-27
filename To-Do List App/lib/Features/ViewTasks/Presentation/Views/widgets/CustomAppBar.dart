// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';

class CustomAppBar {
  static AppBar appBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: const Color(0xffeff3fe),
      surfaceTintColor: const Color(0xffeff3fe),
      elevation: .25,
      shadowColor: Colors.black,
      title: const Text('Upcoming', style: Styles.black20Bold),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}
