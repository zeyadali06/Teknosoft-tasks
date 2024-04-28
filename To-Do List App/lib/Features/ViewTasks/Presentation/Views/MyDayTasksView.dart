// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/FloatingButton.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/MyDayTasksViewBody.dart';

class MyDayTasksView extends StatelessWidget {
  const MyDayTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'My Day'),
      body: MyDayTasksViewBody(),
      floatingActionButton: FloatingButton(),
    );
  }
}
