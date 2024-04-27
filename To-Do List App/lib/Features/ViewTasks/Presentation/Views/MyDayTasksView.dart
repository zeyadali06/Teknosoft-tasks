// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/MyDayTaskViewAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/MyDayTasksViewBody.dart';

class MyDayTasksView extends StatelessWidget {
  const MyDayTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyDayTasksViewAppBar.appBar(context),
      body: const MyDayTasksViewBody(),
    );
  }
}
