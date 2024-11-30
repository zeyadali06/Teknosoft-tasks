import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/CommonWidgets/FloatingButton.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/UpcomingTasks/upcoming_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/UpcomingTasksViewBody.dart';

class UpcomingTasksView extends StatelessWidget {
  const UpcomingTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Upcoming'),
      body: const UpcomingTasksViewBody(),
      floatingActionButton: FloatingButton(onPop: () => BlocProvider.of<UpcomingTasksCubit>(context).getUpcomingTasks(BlocProvider.of<UpcomingTasksCubit>(context).whenRefreshDateTime)),
    );
  }
}
