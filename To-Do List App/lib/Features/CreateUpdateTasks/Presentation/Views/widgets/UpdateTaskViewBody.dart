// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_list_app/Core/Common/CustomButton.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/UpdateTaskCubit/update_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomDropDownButton.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomTextFormField.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/UpdateTaskEnterDateAndTimeField.dart';
import 'package:todo_list_app/constants.dart';

class UpdateTaskViewBody extends StatefulWidget {
  const UpdateTaskViewBody({super.key});

  @override
  State<UpdateTaskViewBody> createState() => _UpdateTaskViewBodyState();
}

class _UpdateTaskViewBodyState extends State<UpdateTaskViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController descripitionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    titleController.text = BlocProvider.of<UpdateTaskCubit>(context).task.title;
    descripitionController.text = BlocProvider.of<UpdateTaskCubit>(context).task.description;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descripitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
      listener: (context, state) {
        if (state is UpdateTaskLoading) {
          isLoading = true;
        } else if (state is UpdateTaskSuccessed) {
          isLoading = false;
          Navigator.of(context).pop();
        } else if (state is UpdateTaskFailed) {
          isLoading = false;
          showSnakeBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: GradientColor(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title text field
                    CustomTextFormField(
                      hintText: 'Title',
                      controller: titleController,
                      inputFormatters: [LengthLimitingTextInputFormatter(25)],
                      onSaved: onTitleSaved,
                    ),

                    // Descripition text field
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      hintText: 'Descripition',
                      controller: descripitionController,
                      onSaved: onDescriptionSaved,
                    ),

                    // Category text field
                    const SizedBox(height: 20),
                    Text('Category:', style: Styles.blue18Bold.copyWith(color: Colors.black)),
                    const SizedBox(height: 5),
                    CustomDropdownButton(
                      thingsToDisplay: Category.allToString,
                      initialText: BlocProvider.of<UpdateTaskCubit>(context).task.category,
                      onSelected: onCategorySelected,
                    ),

                    // Priority text field
                    const SizedBox(height: 20),
                    Text('Priority:', style: Styles.blue18Bold.copyWith(color: Colors.black)),
                    const SizedBox(height: 5),
                    CustomDropdownButton(
                      thingsToDisplay: Priority.allToString,
                      initialText: BlocProvider.of<UpdateTaskCubit>(context).task.priority,
                      onSelected: onPrioritySelected,
                    ),

                    // Start and End date
                    const SizedBox(height: 20),
                    const UpdateTaskEnterDateAndTimeField(),

                    // Add New Task button
                    const SizedBox(height: 20),
                    CustomButton(buttonText: 'Save Changes', onPressed: onPressed),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onTitleSaved(String? title) {
    BlocProvider.of<UpdateTaskCubit>(context).task.title = title!;
    BlocProvider.of<UpdateTaskCubit>(context).task.save();
  }

  void onDescriptionSaved(String? description) {
    BlocProvider.of<UpdateTaskCubit>(context).task.description = description!;
    BlocProvider.of<UpdateTaskCubit>(context).task.save();
  }

  void onCategorySelected(String? category) {
    BlocProvider.of<UpdateTaskCubit>(context).task.category = Category.find(category!)!.name;
    BlocProvider.of<UpdateTaskCubit>(context).task.save();
  }

  void onPrioritySelected(String? priority) {
    BlocProvider.of<UpdateTaskCubit>(context).task.priority = Priority.find(priority!)!.name;
    BlocProvider.of<UpdateTaskCubit>(context).task.save();
  }

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await BlocProvider.of<UpdateTaskCubit>(context).saveTask();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
