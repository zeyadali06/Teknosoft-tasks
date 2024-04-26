// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/AddTaskCubit/add_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/CreateNewTaskView.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff5697a9), Color(0xff4b67b6)],
        ),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => AddTaskCubit(),
                child: const CreateNewTaskView(),
              ),
            ),
          );
        },
        icon: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 23,
          child: Icon(Icons.add, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
