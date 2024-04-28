// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/Core/CommonWidgets/ImportantStar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/CreateTaskCubit/create_task_cubit.dart';

class CreateNewTaskViewAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CreateNewTaskViewAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CreateNewTaskViewAppBar> createState() => _CreateNewTaskViewAppBarState();
}

class _CreateNewTaskViewAppBarState extends State<CreateNewTaskViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffeff3fe),
      surfaceTintColor: const Color(0xffeff3fe),
      elevation: .25,
      shadowColor: Colors.black,
      title: const Text('Add Task', style: Styles.black20Bold),
      centerTitle: true,
      actions: [
        ImportantStar(
          isChecked: BlocProvider.of<AddTaskCubit>(context).important,
          onPressed: () async {
            BlocProvider.of<AddTaskCubit>(context).important = !(BlocProvider.of<AddTaskCubit>(context).important);
            setState(() {});
            // return BlocProvider.of<AddTaskCubit>(context).important;
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}
