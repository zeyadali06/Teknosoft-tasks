// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomPopScope.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/CommonWidgets/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/UpcomingTasks/upcoming_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class UpcomingTasksViewBody extends StatefulWidget {
  const UpcomingTasksViewBody({super.key});

  @override
  State<UpcomingTasksViewBody> createState() => _UpcomingTasksViewBodyState();
}

class _UpcomingTasksViewBodyState extends State<UpcomingTasksViewBody> {
  late List<TaskModel> tasks;
  DateTime datetime = DateTime.now();

  @override
  void initState() {
    tasks = BlocProvider.of<UpcomingTasksCubit>(context).getTasks(DateTime.now());
    BlocProvider.of<UpcomingTasksCubit>(context).datetime = DateTime.now().add(const Duration(days: 1));
    BlocProvider.of<UpcomingTasksCubit>(context).startMidNightTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingTasksCubit, UpcomingTasksState>(
      builder: (context, state) {
        return CustomPopScope(
          toScreenPath: AppRouter.kHomePath,
          child: GradientColor(
            child: Builder(
              builder: (context) {
                if (state is UpcomingTasksFailed) {
                  showSnakeBar(context, state.errMessage);
                  return const Column();
                } else {
                  tasks = BlocProvider.of<UpcomingTasksCubit>(context).tasks;
                  return Column(
                    children: [
                      CustomCalendar(
                        onDaySelected: (date) {
                          datetime = date;
                          BlocProvider.of<UpcomingTasksCubit>(context).datetime = date;
                          tasks = BlocProvider.of<UpcomingTasksCubit>(context).getTasks(date);
                        },
                      ),
                      if (tasks.isEmpty)
                        const Expanded(child: Center(child: LottieImage()))
                      else
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(kPadding),
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomTaskContainer(
                                task: tasks[index],
                                onDismissed: (direction) async {
                                  datetime = DateTime.parse(tasks[index].from.toString());
                                  await tasks[index].delete();
                                  tasks = BlocProvider.of<UpcomingTasksCubit>(context).getTasks(datetime);
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
