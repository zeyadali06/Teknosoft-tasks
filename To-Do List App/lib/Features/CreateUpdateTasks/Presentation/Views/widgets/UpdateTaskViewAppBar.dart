// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/ImportantStar.dart';
import 'package:todo_list_app/Core/Utils/Styles.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Presentation/Manager/UpdateTaskCubit/update_task_cubit.dart';

class UpdateTaskViewAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UpdateTaskViewAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<UpdateTaskViewAppBar> createState() => _UpdateTaskViewAppBarState();
}

class _UpdateTaskViewAppBarState extends State<UpdateTaskViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffeff3fe),
      surfaceTintColor: const Color(0xffeff3fe),
      elevation: .25,
      shadowColor: Colors.black,
      title: const Text('Edit Task', style: Styles.black20Bold),
      centerTitle: true,
      actions: [
        ImportantStar(
          isChecked: BlocProvider.of<UpdateTaskCubit>(context).task.important,
          onPressed: () async {
            BlocProvider.of<UpdateTaskCubit>(context).task.important = !(BlocProvider.of<UpdateTaskCubit>(context).task.important);
            setState(() {});
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
