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
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/ImportantTasks/important_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomCalendar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class ImportantTasksViewBody extends StatefulWidget {
  const ImportantTasksViewBody({super.key});

  @override
  State<ImportantTasksViewBody> createState() => _ImportantTasksViewBodyState();
}

class _ImportantTasksViewBodyState extends State<ImportantTasksViewBody> {
  List<TaskModel> tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    tasks = BlocProvider.of<ImportantTasksCubit>(context).getTasks(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImportantTasksCubit, ImportantTasksState>(
      listener: (context, state) {
        if (state is ImportantTasksLoading) {
          isLoading = true;
        } else if (state is ImportantTasksSuccessed) {
          isLoading = false;
        } else if (state is ImportantTasksFailed) {
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
                    func: (dateTime) {
                      BlocProvider.of<ImportantTasksCubit>(context).getTasks(dateTime);
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
          ),
        );
      },
    );
  }
}
