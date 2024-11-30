import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/Home/Data/Models/CategoryModel.dart';
import 'package:todo_list_app/constants.dart';

class TasksCategory extends StatefulWidget {
  const TasksCategory({super.key, required this.category, required this.onPop});

  final CategoryModel category;
  final void Function() onPop;

  @override
  State<TasksCategory> createState() => _TasksCategoryState();
}

class _TasksCategoryState extends State<TasksCategory> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context).pushNamed(AppRoutes.kTasksOfCategoryPath, arguments: widget.category.category);
          widget.onPop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kRaduis),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.category.colorGradient,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(widget.category.imagePath, width: 22, height: 22),
              const SizedBox(height: 10),
              Text(widget.category.category.name, style: Styles.white18w500),
              Text('${(widget.category.tasks >= 10) ? widget.category.tasks : '0${widget.category.tasks}'} Tasks', style: Styles.white12Bold),
            ],
          ),
        ),
      ),
    );
  }
}
