import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/NoThingToShow.dart';
import 'package:todo_list_app/Core/Common/SnackBar.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/UpcomingTasks/upcoming_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Core/Common/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class UpcomingTasksViewBody extends StatefulWidget {
  const UpcomingTasksViewBody({super.key});

  @override
  State<UpcomingTasksViewBody> createState() => _UpcomingTasksViewBodyState();
}

class _UpcomingTasksViewBodyState extends State<UpcomingTasksViewBody> {
  late List<TaskModel> tasks;

  @override
  void initState() {
    tasks = BlocProvider.of<UpcomingTasksCubit>(context).getTasks(DateTime.now());
    BlocProvider.of<UpcomingTasksCubit>(context).timerDateTime = DateTime.now().add(const Duration(days: 1));
    BlocProvider.of<UpcomingTasksCubit>(context).startMidNightTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingTasksCubit, UpcomingTasksState>(
      builder: (context, state) {
        return GradientColor(
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
                        BlocProvider.of<UpcomingTasksCubit>(context).whenRefreshDateTime = date;
                        BlocProvider.of<UpcomingTasksCubit>(context).timerDateTime = date;
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
                                DateTime datetime = DateTime.parse(tasks[index].from.toString());
                                await tasks[index].delete();
                                if (context.mounted) {
                                  tasks = BlocProvider.of<UpcomingTasksCubit>(context).getTasks(datetime);
                                }
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
        );
      },
    );
  }
}
