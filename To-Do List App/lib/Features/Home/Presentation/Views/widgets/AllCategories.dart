// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskCategories.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
