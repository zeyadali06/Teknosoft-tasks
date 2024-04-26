// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/RowOfTaskLevel.dart';
import 'package:todo_list_app/constants.dart';

class TaskLevelContainer extends StatelessWidget {
  const TaskLevelContainer({
    super.key,
    required this.myDayTasks,
  });

  final int myDayTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRaduis),
        color: const Color(0xfff4f7fe),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: [
            RowOfTaskLevel(
              myDayTasks: myDayTasks,
              text: 'My Day',
              imagePath: 'assets/images/Screenshot 2024-04-24 224102.png',
              screenPath: AppRouter.kMyDayTasksPath,
            ),
            Divider(color: Colors.blue.withOpacity(.15)),
            RowOfTaskLevel(
              myDayTasks: myDayTasks,
              text: 'Upcoming',
              imagePath: 'assets/images/Screenshot 2024-04-24 231327.png',
              screenPath: AppRouter.kUpcomingTasksPath,
            ),
            Divider(color: Colors.blue.withOpacity(.15)),
            RowOfTaskLevel(
              myDayTasks: myDayTasks,
              text: 'Important',
              imagePath: 'assets/images/Screenshot 2024-04-24 231442.png',
              screenPath: AppRouter.kImportantTasksPath,
            ),
          ],
        ),
      ),
    );
  }
}
