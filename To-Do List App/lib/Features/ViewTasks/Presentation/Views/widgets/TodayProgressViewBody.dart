import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomTaskContainer.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGradientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/CommonWidgets/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/DI.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/TodayProgress/today_progress_cubit.dart';
import 'package:todo_list_app/constants.dart';

class TodayProgressViewBody extends StatefulWidget {
  const TodayProgressViewBody({super.key});

  @override
  State<TodayProgressViewBody> createState() => _TodayProgressViewBodyState();
}

class _TodayProgressViewBodyState extends State<TodayProgressViewBody> {
  late List<TaskModel> tasks;

  @override
  void initState() {
    tasks = BlocProvider.of<TodayProgressCubit>(context).getTodayFinishedTasks();
    BlocProvider.of<TodayProgressCubit>(context).startMidNightTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayProgressCubit, TodayProgressState>(
      builder: (context, state) {
        return GradientColor(
          child: Builder(
            builder: (BuildContext context) {
              if (state is TodayProgressFailed) {
                showSnakeBar(context, state.errMessage);
                return const Column();
              } else {
                tasks = BlocProvider.of<TodayProgressCubit>(context).tasks;
                if (tasks.isEmpty) {
                  return const Center(child: LottieImage());
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(kPadding),
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomTaskContainer(
                        task: tasks[index],
                        hiveServices: getit<HiveServices>(),
                        onDismissed: (direction) async {
                          await tasks[index].delete();
                          if (context.mounted) {
                            tasks = BlocProvider.of<TodayProgressCubit>(context).getTodayFinishedTasks();
                          }
                        },
                      );
                    },
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
