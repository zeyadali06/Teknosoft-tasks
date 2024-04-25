// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/constants.dart';

class TasksCategory extends StatelessWidget {
  const TasksCategory({super.key, required this.imagePath, required this.category, required this.tasks, required this.colorGradient});

  final String imagePath;
  final String category;
  final int tasks;
  final List<Color> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRaduis),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorGradient,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(imagePath, width: 22, height: 22),
          const SizedBox(height: 10),
          Text(category, style: Styles.white18w500),
          Text('${(tasks >= 10) ? tasks : '0$tasks'} Tasks', style: Styles.white12Bold),
        ],
      ),
    );
  }
}
