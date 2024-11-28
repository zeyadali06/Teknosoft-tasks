import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/NoThingToShow.dart';
import 'package:todo_list_app/Core/Common/SnackBar.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/TasksOfCategorey/tasks_of_categorey_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Core/Common/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class TasksOfCategoryViewBody extends StatefulWidget {
  const TasksOfCategoryViewBody({super.key, required this.category});

  final Category category;

  @override
  State<TasksOfCategoryViewBody> createState() => _TasksOfCategoryViewBodyState();
}

class _TasksOfCategoryViewBodyState extends State<TasksOfCategoryViewBody> {
  late List<TaskModel> tasks;

  @override
  void initState() {
    tasks = BlocProvider.of<TasksOfCategoreyCubit>(context).getTasks(DateTime.now(), widget.category);
    BlocProvider.of<TasksOfCategoreyCubit>(context).timerDateTime = DateTime.now().add(const Duration(days: 1));
    BlocProvider.of<TasksOfCategoreyCubit>(context).startMidNightTimer(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksOfCategoreyCubit, TasksOfCategoreyState>(
      builder: (context, state) {
        return GradientColor(
          child: Builder(
            builder: (context) {
              if (state is TasksOfCategoreyFailed) {
                showSnakeBar(context, state.errMessage);
                return const Column();
              } else {
                tasks = BlocProvider.of<TasksOfCategoreyCubit>(context).tasks;
                return Column(
                  children: [
                    CustomCalendar(
                      onDaySelected: (datetime) {
                        BlocProvider.of<TasksOfCategoreyCubit>(context).whenRefreshDateTime = datetime;
                        BlocProvider.of<TasksOfCategoreyCubit>(context).timerDateTime = datetime;
                        tasks = BlocProvider.of<TasksOfCategoreyCubit>(context).getTasks(datetime, widget.category);
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
                                String category = tasks[index].category;
                                await tasks[index].delete();
                                if (context.mounted) {
                                  tasks = BlocProvider.of<TasksOfCategoreyCubit>(context).getTasks(datetime, Category.find(category)!);
                                }
                              },
                            );
                          },
                        ),
                      )
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
