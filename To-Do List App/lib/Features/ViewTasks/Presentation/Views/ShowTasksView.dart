// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/ShowTaskViewAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/ShowTasksViewBody.dart';

class ShowTasksView extends StatelessWidget {
  const ShowTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowTaskViewAppBar.appBar(context),
      body: ShowTaskViewBody(),
    );
  }
}
