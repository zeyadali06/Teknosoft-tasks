// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomDropDownButton.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(hintText: 'Title', controller: TextEditingController()),
              const SizedBox(height: 15),
              CustomTextFormField(hintText: 'Descripition', controller: TextEditingController()),
              const SizedBox(height: 20),
              Text('Category:', style: Styles.blue18Bold.copyWith(color: Colors.black)),
              const SizedBox(height: 5),
              CustomDropdownButton(thingsToDisplay: Category.all, initialText: Category.firstItem, onSelected: (selected) {}),
              const SizedBox(height: 20),
              Text('Priority:', style: Styles.blue18Bold.copyWith(color: Colors.black)),
              const SizedBox(height: 5),
              CustomDropdownButton(thingsToDisplay: Priority.all, initialText: Priority.firstItem, onSelected: (selected) {}),
            ],
          ),
        ),
      ),
    );
  }
}
