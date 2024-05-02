// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_list_app/Core/Common/CustomButton.dart';
import 'package:todo_list_app/Core/Common/CustomPopScope.dart';
import 'package:todo_list_app/Core/Common/LinearGrdientColor.dart';
import 'package:todo_list_app/Core/Common/SnackBar.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/CreateTaskCubit/create_task_cubit.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomDropDownButton.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CustomTextFormField.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Views/widgets/CreateTaskEnterDateAndTimeField.dart';
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
  bool isLoading = false;

  @override
  void dispose() {
    titleController.dispose();
    descripitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskLoading) {
          isLoading = true;
        } else if (state is AddTaskSuccessed) {
          isLoading = false;
          Navigator.of(context).pop();
        } else if (state is AddTaskFailed) {
          isLoading = false;
          showSnakeBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomPopScope(
          toScreenPath: AppRoutes.kHomePath,
          child: ModalProgressHUD(
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
                        thingsToDisplay: Category.all,
                        initialText: Category.firstItem,
                        onSelected: onCategorySelected,
                      ),

                      // Priority text field
                      const SizedBox(height: 20),
                      Text('Priority:', style: Styles.blue18Bold.copyWith(color: Colors.black)),
                      const SizedBox(height: 5),
                      CustomDropdownButton(
                        thingsToDisplay: Priority.all,
                        initialText: Priority.firstItem,
                        onSelected: onPrioritySelected,
                      ),

                      // Start and End date
                      const SizedBox(height: 20),
                      const CreateTaskEnterDateAndTimeField(),

                      // Add New Task button
                      const SizedBox(height: 20),
                      CustomButton(buttonText: 'Add New Task', onPressed: onPressed),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onTitleSaved(String? title) => BlocProvider.of<AddTaskCubit>(context).title = title!;
  void onDescriptionSaved(String? description) => BlocProvider.of<AddTaskCubit>(context).description = description!;
  void onCategorySelected(String? category) => BlocProvider.of<AddTaskCubit>(context).category = Category.find(category!)!;
  void onPrioritySelected(String? priority) => BlocProvider.of<AddTaskCubit>(context).priority = Priority.find(priority!)!;

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
