// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/CustomButton.dart';
import 'package:todo_list_app/Core/CommonWidgets/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/AddTaskCubit/add_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomDropDownButton.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomTextFormField.dart';
import 'package:todo_list_app/constants.dart';

class CreateNewTaskViewBody extends StatefulWidget {
  const CreateNewTaskViewBody({super.key});

  @override
  State<CreateNewTaskViewBody> createState() => _CreateNewTaskViewBodyState();
}

class _CreateNewTaskViewBodyState extends State<CreateNewTaskViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController descripitionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descripitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - (60 + kPadding),
        child: GradientColor(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextFormField(
                    hintText: 'Title',
                    controller: titleController,
                    inputFormatters: [LengthLimitingTextInputFormatter(25)],
                    onSaved: onTitleSaved,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    hintText: 'Descripition',
                    controller: descripitionController,
                    onSaved: onDescriptionSaved,
                  ),
                  const SizedBox(height: 20),
                  Text('Category:', style: Styles.blue18Bold.copyWith(color: Colors.black)),
                  const SizedBox(height: 5),
                  CustomDropdownButton(
                    thingsToDisplay: Category.all,
                    initialText: Category.firstItem,
                    onSelected: onCategorySelected,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Priority:',
                    style: Styles.blue18Bold.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  CustomDropdownButton(
                    thingsToDisplay: Priority.all,
                    initialText: Priority.firstItem,
                    onSelected: onPrioritySelected,
                  ),
                  const Spacer(),
                  CustomButton(onPressed: onPressed),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTitleSaved(String? title) => BlocProvider.of<AddTaskCubit>(context).title = title!;
  void onDescriptionSaved(String? description) => BlocProvider.of<AddTaskCubit>(context).description = description!;
  void onCategorySelected(String? category) => BlocProvider.of<AddTaskCubit>(context).category = category!;
  void onPrioritySelected(String? priority) => BlocProvider.of<AddTaskCubit>(context).priority = priority!;

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await BlocProvider.of<AddTaskCubit>(context).addTask();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
