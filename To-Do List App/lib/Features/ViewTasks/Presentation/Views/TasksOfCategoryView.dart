// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/FloatingButton.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/TasksOfCategorey/tasks_of_categorey_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/TasksOfCategoryViewBody.dart';

class TasksOfCategoryView extends StatelessWidget {
  const TasksOfCategoryView({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: TasksOfCategoryViewBody(category: category),
      floatingActionButton: FloatingButton(onPop: () => BlocProvider.of<TasksOfCategoreyCubit>(context).getTasks(BlocProvider.of<TasksOfCategoreyCubit>(context).whenRefreshDateTime, category)),
    );
  }
}
