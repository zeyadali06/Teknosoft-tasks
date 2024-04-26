// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff5697a9), Color(0xff4b67b6)],
        ),
      ),
      child: IconButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kCreateTaskPath);
        },
        icon: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 23,
          child: Icon(Icons.add, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
