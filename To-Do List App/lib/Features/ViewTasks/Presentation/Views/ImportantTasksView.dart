// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/FloatingButton.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/ImportantTasksViewBody.dart';

class ImportantTasksView extends StatelessWidget {
  const ImportantTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Important'),
      body: ImportantTasksViewBody(),
      floatingActionButton: FloatingButton(),
    );
  }
}
