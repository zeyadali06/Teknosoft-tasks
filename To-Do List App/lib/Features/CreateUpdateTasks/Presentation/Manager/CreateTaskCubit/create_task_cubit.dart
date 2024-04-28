import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'create_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  late String title;
  late String description;
  Category category = Category.values[0];
  Priority priority = Priority.values[0];
  DateTime? from;
  DateTime? to;
  bool important = false;

  Future<void> addTask() async {
    try {
      if (from == null) {
        emit(AddTaskFailed(errMessage: "Enter Start Date"));
        return;
      }
      if (to == null) {
        emit(AddTaskFailed(errMessage: "Enter End Date"));
        return;
      }

      if (from!.isAfter(to!)) {
        emit(AddTaskFailed(errMessage: "End Date should be after Start Date"));
        return;
      }

      TaskModel task = TaskModel(
        category: category.name,
        priority: priority.name,
        title: title,
        from: from!,
        to: to!,
        description: description,
        important: important,
      );
      emit(AddTaskLoading());
      await addData(task);
      emit(AddTaskSuccessed());
    } catch (_) {
      emit(AddTaskFailed(errMessage: "Error, try again later!"));
    }
  }
}
