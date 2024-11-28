import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Common/FloatingButton.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Manager/ImportantTasks/important_tasks_cubit.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/CustomAppBar.dart';
import 'package:todo_list_app/Features/ViewTasks/Presentation/Views/widgets/ImportantTasksViewBody.dart';

class ImportantTasksView extends StatelessWidget {
  const ImportantTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Important'),
      body: const ImportantTasksViewBody(),
      floatingActionButton: FloatingButton(onPop: () => BlocProvider.of<ImportantTasksCubit>(context).getTasks(BlocProvider.of<ImportantTasksCubit>(context).whenRefreshDateTime)),
    );
  }
}
