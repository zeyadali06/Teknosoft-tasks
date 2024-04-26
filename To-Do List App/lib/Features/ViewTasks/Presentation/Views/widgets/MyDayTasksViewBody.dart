// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/MyDayTasks/my_day_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class MyDayTasksViewBody extends StatefulWidget {
  const MyDayTasksViewBody({super.key});

  @override
  State<MyDayTasksViewBody> createState() => _MyDayTasksViewBodyState();
}

class _MyDayTasksViewBodyState extends State<MyDayTasksViewBody> {
  late List<TaskModel> tasks;

  @override
  void initState() {
    tasks = BlocProvider.of<MyDayTasksCubit>(context).getMyDayTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GradientColor(
      child: ListView.builder(
        padding: const EdgeInsets.all(kPadding),
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTaskContainer(task: tasks[index]);
        },
      ),
    );
  }
}
