// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/ShowTasksViewAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/ShowTasksViewBody.dart';

class ShowTasksView extends StatelessWidget {
  const ShowTasksView({super.key, required this.appBarTitle});
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShowTasksViewAppBar.appBar(context, title: appBarTitle),
      body: const ShowTasksViewBody(),
    );
  }
}
