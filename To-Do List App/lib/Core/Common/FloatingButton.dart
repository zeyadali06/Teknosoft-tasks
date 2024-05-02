// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, this.onPop});

  final void Function()? onPop;

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
        onPressed: () async {
          await Navigator.of(context).pushNamed(AppRoutes.kCreateTaskPath);
          if (onPop != null) {
            onPop!();
          }
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
