// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/constants.dart';

class TasksCategory extends StatefulWidget {
  const TasksCategory({super.key, required this.imagePath, required this.category, required this.tasks, required this.colorGradient, required this.onPop});

  final String imagePath;
  final Category category;
  final int tasks;
  final List<Color> colorGradient;
  final void Function() onPop;

  @override
  State<TasksCategory> createState() => _TasksCategoryState();
}

class _TasksCategoryState extends State<TasksCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).pushNamed(AppRoutes.kTasksOfCategoryPath, arguments: widget.category);
        widget.onPop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRaduis),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.colorGradient,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(widget.imagePath, width: 22, height: 22),
            const SizedBox(height: 10),
            Text(widget.category.name, style: Styles.white18w500),
            Text('${(widget.tasks >= 10) ? widget.tasks : '0${widget.tasks}'} Tasks', style: Styles.white12Bold),
          ],
        ),
      ),
    );
  }
}
