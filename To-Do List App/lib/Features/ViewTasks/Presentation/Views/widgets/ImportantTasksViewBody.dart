import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGradientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/CommonWidgets/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/DI.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/ImportantTasks/important_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class ImportantTasksViewBody extends StatefulWidget {
  const ImportantTasksViewBody({super.key});

  @override
  State<ImportantTasksViewBody> createState() => _ImportantTasksViewBodyState();
}

class _ImportantTasksViewBodyState extends State<ImportantTasksViewBody> {
  late List<TaskModel> tasks;

  @override
  void initState() {
    tasks = BlocProvider.of<ImportantTasksCubit>(context).getImportantTasks(DateTime.now());
    BlocProvider.of<ImportantTasksCubit>(context).timerDateTime = DateTime.now().add(const Duration(days: 1));
    BlocProvider.of<ImportantTasksCubit>(context).startMidNightTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportantTasksCubit, ImportantTasksState>(
      builder: (context, state) {
        return GradientColor(
          child: Builder(
            builder: (context) {
              if (state is ImportantTasksFailed) {
                showSnakeBar(context, state.errMessage);
                return const Column();
              } else {
                tasks = BlocProvider.of<ImportantTasksCubit>(context).tasks;
                return Column(
                  children: [
                    CustomCalendar(
                      onDaySelected: (dateTime) {
                        BlocProvider.of<ImportantTasksCubit>(context).whenRefreshDateTime = dateTime;
                        BlocProvider.of<ImportantTasksCubit>(context).timerDateTime = dateTime;
                        tasks = BlocProvider.of<ImportantTasksCubit>(context).getImportantTasks(dateTime);
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
                              hiveServices: getit<HiveServices>(),
                              onDismissed: (direction) async {
                                DateTime datetime = DateTime.parse(tasks[index].from.toString());
                                await tasks[index].delete();
                                if (context.mounted) {
                                  tasks = BlocProvider.of<ImportantTasksCubit>(context).getImportantTasks(datetime);
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
