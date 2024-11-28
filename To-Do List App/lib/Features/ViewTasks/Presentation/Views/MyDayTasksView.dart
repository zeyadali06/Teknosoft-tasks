import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/FloatingButton.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/MyDayTasks/my_day_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/MyDayTasksViewBody.dart';

class MyDayTasksView extends StatelessWidget {
  const MyDayTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Day'),
      body: const MyDayTasksViewBody(),
      floatingActionButton: FloatingButton(onPop: () => BlocProvider.of<MyDayTasksCubit>(context).getMyDayTasks()),
    );
  }
}
