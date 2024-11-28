import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/UpdateTaskCubit/update_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/UpdateTaskViewAppBar.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/UpdateTaskViewBody.dart';

class UpdateTaskView extends StatelessWidget {
  const UpdateTaskView({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UpdateTaskCubit>(context).task = task;
    return const Scaffold(
      appBar: UpdateTaskViewAppBar(),
      body: UpdateTaskViewBody(),
    );
  }
}
