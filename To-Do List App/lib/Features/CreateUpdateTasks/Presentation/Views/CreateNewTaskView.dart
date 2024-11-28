import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CreateNewTaskViewAppBar.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CreateNewTaskViewBody.dart';

class CreateNewTaskView extends StatelessWidget {
  const CreateNewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        appBar: CreateNewTaskViewAppBar(),
        body: CreateNewTaskViewBody(),
      ),
    );
  }
}
