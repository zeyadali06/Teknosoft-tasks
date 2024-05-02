// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/AppRouter.dart';
import 'package:todo_list_app/Features/Home/Presentation/Manager/HomeView/home_view_cubit.dart';
import 'package:todo_list_app/Features/Home/Presentation/Views/widgets/RowOfTaskLevel.dart';
import 'package:todo_list_app/constants.dart';

class TaskLevelContainer extends StatelessWidget {
  const TaskLevelContainer({super.key, required this.onPop});

  final void Function() onPop;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRaduis),
        color: const Color(0xfff4f7fe),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: [
            RowOfTaskLevel(
              myDayTasks: BlocProvider.of<HomeViewCubit>(context).myDayTasks,
              text: 'My Day',
              imagePath: 'assets/images/Screenshot 2024-04-24 224102.png',
              screenPath: AppRoutes.kMyDayTasksPath,
              onPop: onPop,
            ),
            Divider(color: Colors.blue.withOpacity(.15)),
            RowOfTaskLevel(
              myDayTasks: BlocProvider.of<HomeViewCubit>(context).upcomingTasks,
              text: 'Upcoming',
              imagePath: 'assets/images/Screenshot 2024-04-24 231327.png',
              screenPath: AppRoutes.kUpcomingTasksPath,
              onPop: onPop,
            ),
            Divider(color: Colors.blue.withOpacity(.15)),
            RowOfTaskLevel(
              myDayTasks: BlocProvider.of<HomeViewCubit>(context).importantTasks,
              text: 'Important',
              imagePath: 'assets/images/Screenshot 2024-04-24 231442.png',
              screenPath: AppRoutes.kImportantTasksPath,
              onPop: onPop,
            ),
          ],
        ),
      ),
    );
  }
}
