import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Domain/RepoInterface/TaskManagementRepo.dart';

part 'create_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.repo) : super(AddTaskInitial());

  final TaskManagementRepo repo;

  late String title;
  late String description;
  Category category = Category.values[0];
  Priority priority = Priority.values[0];
  DateTime? from;
  DateTime? to;
  bool important = false;

  Future<void> addTask() async {
    emit(AddTaskLoading());

    Result res = await repo.addTask(
      TaskModel(
        category: category.name,
        priority: priority.name,
        title: title,
        from: from!,
        to: to!,
        description: description,
        important: important,
        createdAt: DateTime.now(),
      ),
    );

    if (res is ResultSuccess) {
      emit(AddTaskSuccessed());
    } else if (res is ResultFailure) {
      emit(AddTaskFailed(errMessage: res.failure.message));
    }
  }
}
