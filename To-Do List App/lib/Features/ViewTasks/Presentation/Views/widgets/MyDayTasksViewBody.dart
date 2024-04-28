// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomPopScope.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/CommonWidgets/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
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
  bool isLoading = false;
  late List<TaskModel> tasks;
  late Timer timer;
  Timer? longTimer;

  @override
  void initState() {
    tasks = BlocProvider.of<MyDayTasksCubit>(context).getMyDayTasks();
    final DateTime now = DateTime.now();
    final DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final Duration duration = nextMidnight.difference(now);
    timer = Timer(duration, () {
      tasks = BlocProvider.of<MyDayTasksCubit>(context).getMyDayTasks();
      longTimer = Timer.periodic(const Duration(days: 1), (Timer timer) {
        tasks = BlocProvider.of<MyDayTasksCubit>(context).getMyDayTasks();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    if (longTimer != null) {
      longTimer!.cancel();
    }
    tasks.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyDayTasksCubit, MyDayTasksState>(
      listener: (context, state) {
        if (state is MyDayTasksLoading) {
          isLoading = true;
        } else if (state is MyDayTasksSuccess) {
          isLoading = false;
        } else if (state is MyDayTasksFailed) {
          isLoading = false;
          showSnakeBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomPopScope(
          toScreenPath: AppRouter.kHomePath,
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: GradientColor(
              child: tasks.isEmpty
                  ? const Center(child: LottieImage())
                  : ListView.builder(
                      padding: const EdgeInsets.all(kPadding),
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomTaskContainer(task: tasks[index]);
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
