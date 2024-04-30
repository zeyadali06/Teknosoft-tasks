// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/CustomPopScope.dart';
import 'package:todo_list_app/Core/Common/CustomTaskContainer.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/NoThingToShow.dart';
import 'package:todo_list_app/Core/Common/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
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
        return CustomPopScope(
          toScreenPath: AppRoutes.kHomePath,
          child: GradientColor(
            child: Builder(
              builder: (BuildContext context) {
                if (state is TodayProgressFailed) {
                  showSnakeBar(context, state.errMessage);
                  return const Column();
                } else {
                  tasks = BlocProvider.of<TodayProgressCubit>(context).tasks;
                  if (tasks.isEmpty) {
                    return const Expanded(child: Center(child: LottieImage()));
                  } else {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(kPadding),
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomTaskContainer(
                          task: tasks[index],
                          onDismissed: (direction) async {
                            await tasks[index].delete();
                            tasks = BlocProvider.of<TodayProgressCubit>(context).getTodayFinishedTasks();
                          },
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
