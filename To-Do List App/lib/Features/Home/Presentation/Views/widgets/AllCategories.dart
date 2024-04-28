// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomePage/home_view_cubit.dart';
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
        children: [
          TasksCategory(
            imagePath: 'assets/images/Screenshot 2024-04-25 002248.png',
            category: Category.Personal,
            tasks: BlocProvider.of<HomePageCubit>(context).personalTasks,
            colorGradient: Category.Personal.gradient,
          ),
          TasksCategory(
            imagePath: 'assets/images/Screenshot 2024-04-25 011727.png',
            category: Category.Learning,
            tasks: BlocProvider.of<HomePageCubit>(context).learningTasks,
            colorGradient: Category.Learning.gradient,
          ),
          TasksCategory(
            imagePath: 'assets/images/Screenshot 2024-04-25 011814.png',
            category: Category.Work,
            tasks: BlocProvider.of<HomePageCubit>(context).workTasks,
            colorGradient: Category.Work.gradient,
          ),
          TasksCategory(
            imagePath: 'assets/images/Screenshot 2024-04-25 012510.png',
            category: Category.Shopping,
            tasks: BlocProvider.of<HomePageCubit>(context).shoppingTasks,
            colorGradient: Category.Shopping.gradient,
          ),
        ],
      ),
    );
  }
}
