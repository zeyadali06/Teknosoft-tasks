// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomPopScope.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/CommonWidgets/NoThingToShow.dart';
import 'package:todo_list_app/Core/CommonWidgets/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/UpcomingTasks/upcoming_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class UpcomingTasksViewBody extends StatefulWidget {
  const UpcomingTasksViewBody({super.key});

  @override
  State<UpcomingTasksViewBody> createState() => _UpcomingTasksViewBodyState();
}

class _UpcomingTasksViewBodyState extends State<UpcomingTasksViewBody> {
  bool isLoading = false;
  List<TaskModel> tasks = [];

  @override
  void initState() {
    tasks = BlocProvider.of<UpcomingTasksCubit>(context).getTasks(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpcomingTasksCubit, UpcomingTasksState>(
      listener: (context, state) {
        if (state is UpcomingTasksLoading) {
          isLoading = true;
        } else if (state is UpcomingTasksSuccessed) {
          isLoading = false;
        } else if (state is UpcomingTasksFailed) {
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
              child: Column(
                children: [
                  CustomCalendar(
                    onDaySelected: (dateTime) {
                      BlocProvider.of<UpcomingTasksCubit>(context).getTasks(dateTime);
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
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
