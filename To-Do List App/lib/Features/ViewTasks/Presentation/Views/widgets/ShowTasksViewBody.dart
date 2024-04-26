// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomTaskContainer.dart';
import 'package:todo_list_app/constants.dart';

class ShowTaskViewBody extends StatelessWidget {
  const ShowTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientColor(
      child: ListView.builder(
        padding: const EdgeInsets.all(kPadding),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return const CustomTaskContainer();
        },
      ),
    );
  }
}
