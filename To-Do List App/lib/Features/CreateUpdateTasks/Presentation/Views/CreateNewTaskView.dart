// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CreateNewTaskViewAppBar.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CreateNewTaskViewBody.dart';

class CreateNewTaskView extends StatelessWidget {
  const CreateNewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CreateNewTaskViewAppBar.appBar(),
        body: const CreateNewTaskViewBody(),
      ),
    );
  }
}

