// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/TasksOfCategoryViewBody.dart';

class TasksOfCategoryView extends StatelessWidget {
  const TasksOfCategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(context, category),
      body: TasksOfCategoryViewBody(category: category),
    );
  }
}