// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomPopScope.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/TasksOfCategorey/tasks_of_categorey_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class TasksOfCategoryViewBody extends StatefulWidget {
  const TasksOfCategoryViewBody({super.key, required this.category});

  final Category category;

  @override
  State<TasksOfCategoryViewBody> createState() => _TasksOfCategoryViewBodyState();
}

class _TasksOfCategoryViewBodyState extends State<TasksOfCategoryViewBody> {
  List<TaskModel> tasks = [];

  @override
  void initState() {
    tasks = BlocProvider.of<TasksOfCategoreyCubit>(context).getTasks(DateTime.now(), widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksOfCategoreyCubit, TasksOfCategoreyState>(
      builder: (context, state) {
        return CustomPopScope(
          toScreenPath: AppRouter.kHomePath,
          child: GradientColor(
            child: Column(
              children: [
                CustomCalendar(
                  onDaySelected: (datetime) {
                    tasks = BlocProvider.of<TasksOfCategoreyCubit>(context).getTasks(datetime, widget.category);
                  },
                ),
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
      },
    );
  }
}
