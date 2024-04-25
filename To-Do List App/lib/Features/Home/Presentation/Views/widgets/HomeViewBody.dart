// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskCategories.dart';
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
                Expanded(
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 6 / 5,
                    ),
                    children: const [
                      TasksCategory(
                        imagePath: 'assets/images/Screenshot 2024-04-25 002248.png',
                        category: 'Personal',
                        tasks: 1,
                        colorGradient: [Color(0xff7d9bdf), Color(0xff5070c5)],
                      ),
                      TasksCategory(
                        imagePath: 'assets/images/Screenshot 2024-04-25 011727.png',
                        category: 'Learning',
                        tasks: 2,
                        colorGradient: [Color(0xffbc7096), Color(0xff7474c4)],
                      ),
                      TasksCategory(
                        imagePath: 'assets/images/Screenshot 2024-04-25 011814.png',
                        category: 'Work',
                        tasks: 10,
                        colorGradient: [Color(0xff669bab), Color(0xff6182ca)],
                      ),
                      TasksCategory(
                        imagePath: 'assets/images/Screenshot 2024-04-25 012510.png',
                        category: 'Shopping',
                        tasks: 4,
                        colorGradient: [Color(0xffff9187), Color(0xffe36163)],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
