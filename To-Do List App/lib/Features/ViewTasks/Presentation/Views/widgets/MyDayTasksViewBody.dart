// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class MyDayTasksViewBody extends StatelessWidget {
  MyDayTasksViewBody({super.key});

  final List<TaskModel> tasks = getData();

  @override
  Widget build(BuildContext context) {
    return GradientColor(
      child: ListView.builder(
        padding: const EdgeInsets.all(kPadding),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTaskContainer(task: tasks[index]);
        },
      ),
    );
  }
}
