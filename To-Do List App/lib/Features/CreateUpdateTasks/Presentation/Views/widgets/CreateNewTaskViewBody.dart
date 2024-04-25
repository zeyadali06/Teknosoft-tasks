// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomTextFormField.dart';
import 'package:todo_list_app/constants.dart';

class CreateNewTaskViewBody extends StatelessWidget {
  const CreateNewTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientColor(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(hintText: 'Title', controller: TextEditingController()),
              const SizedBox(height: 15),
              CustomTextFormField(hintText: 'Descripition', controller: TextEditingController()),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
