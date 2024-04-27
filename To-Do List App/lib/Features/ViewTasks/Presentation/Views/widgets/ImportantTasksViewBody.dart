// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class ImportantTasksViewBody extends StatefulWidget {
  const ImportantTasksViewBody({super.key});

  @override
  State<ImportantTasksViewBody> createState() => _ImportantTasksViewBodyState();
}

class _ImportantTasksViewBodyState extends State<ImportantTasksViewBody> {
  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return GradientColor(
        child: Column(
      children: [
        // const CustomCalendar(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(kPadding),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomTaskContainer(task: tasks[index]);
            },
          ),
        ),
      ],
    ));
  }
}
