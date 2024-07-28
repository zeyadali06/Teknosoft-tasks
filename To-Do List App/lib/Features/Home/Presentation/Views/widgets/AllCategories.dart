// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/Home/Data/Models/CategoryModel.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/TaskCategories.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key, required this.onPop});

  final void Function() onPop;

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  late List<CategoryModel> categories;

  @override
  void initState() {
    categories = [
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 002248.png',
        category: Category.Personal,
        tasks: BlocProvider.of<HomeViewCubit>(context).personalTasks,
        colorGradient: Category.Personal.gradient,
      ),
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 011727.png',
        category: Category.Learning,
        tasks: BlocProvider.of<HomeViewCubit>(context).learningTasks,
        colorGradient: Category.Learning.gradient,
      ),
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 011814.png',
        category: Category.Work,
        tasks: BlocProvider.of<HomeViewCubit>(context).workTasks,
        colorGradient: Category.Work.gradient,
      ),
      CategoryModel(
        imagePath: 'assets/images/Screenshot 2024-04-25 012510.png',
        category: Category.Shopping,
        tasks: BlocProvider.of<HomeViewCubit>(context).shoppingTasks,
        colorGradient: Category.Shopping.gradient,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TasksCategory(
              category: categories[0],
              onPop: widget.onPop,
            ),
            const SizedBox(width: 15),
            TasksCategory(
              category: categories[1],
              onPop: widget.onPop,
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            TasksCategory(
              category: categories[2],
              onPop: widget.onPop,
            ),
            const SizedBox(width: 15),
            TasksCategory(
              category: categories[3],
              onPop: widget.onPop,
            ),
          ],
        ),
      ],
    );
  }
}
