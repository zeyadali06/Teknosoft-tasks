import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  late String title;
  late String description;
  late String category;
  late String priority;
  late bool important;

  Future<void> addTask() async {
    TaskModel task = TaskModel(
      category: category,
      priority: priority,
      title: title,
      description: description,
      datetime: DateTime.now(),
      important: important,
    );
    try {
      emit(AddTaskLoading());
      await addData(task);
      emit(AddTaskSuccessed());
    } catch (_) {
      emit(AddTaskFailed());
    }
  }
}
