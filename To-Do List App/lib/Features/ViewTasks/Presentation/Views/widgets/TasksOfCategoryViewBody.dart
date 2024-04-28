// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomPopScope.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class TasksOfCategoryViewBody extends StatefulWidget {
  const TasksOfCategoryViewBody({super.key, required this.category});

  final String category;

  @override
  State<TasksOfCategoryViewBody> createState() => _TasksOfCategoryViewBodyState();
}

class _TasksOfCategoryViewBodyState extends State<TasksOfCategoryViewBody> {
  late List<TaskModel> tasks = getData();

  @override
  Widget build(BuildContext context) {
    return CustomPopScope(
      toScreenPath: AppRouter.kHomePath,
      child: GradientColor(
        child: Column(
          children: [
            CustomCalendar(onDaySelected: (datetime) {}),
            tasks.isEmpty
                ? const Center(child: LottieImage())
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(kPadding),
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomTaskContainer(task: tasks[index]);
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
