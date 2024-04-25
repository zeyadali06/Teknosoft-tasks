// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/AllCategories.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskLevelContainer.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TopBar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  final int task = 5;
  final int myDayTasks = 5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: GradientColor(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TopBar(task: task),
                const SizedBox(height: 10),
                Divider(color: Colors.grey.withOpacity(.15)),
                const SizedBox(height: 10),
                TaskLevelContainer(myDayTasks: myDayTasks),
                const SizedBox(height: 25),
                const AllCategories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
