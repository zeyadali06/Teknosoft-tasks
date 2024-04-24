// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';

class RowOfTaskLevel extends StatelessWidget {
  const RowOfTaskLevel({super.key, required this.myDayTasks, required this.imagePath, required this.text});

  final int myDayTasks;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Image.asset(imagePath, width: 25),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(text, style: Styles.blue18Bold),
              const SizedBox(height: 6),
              Text('$myDayTasks tasks', style: Styles.grey12Bold),
              const SizedBox(height: 2),
            ],
          ),
        ],
      ),
    );
  }
}