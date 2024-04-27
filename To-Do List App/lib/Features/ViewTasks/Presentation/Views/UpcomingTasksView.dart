// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/UpcomingTasksViewBody.dart';

class UpcomingTasksView extends StatelessWidget {
  const UpcomingTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(context, 'Upcoming'),
      body: const UpcomingTasksViewBody(),
    );
  }
}
