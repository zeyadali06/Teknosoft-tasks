import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'tasks_of_categorey_state.dart';

class TasksOfCategoreyCubit extends Cubit<TasksOfCategoreyState> {
  TasksOfCategoreyCubit() : super(TasksOfCategoreyInitial());
  List<TaskModel> tasks = [];

  List<TaskModel> getTasks(DateTime datetime, Category cat) {
    try {
      List<TaskModel> allTasks = getData();
      tasks.clear();

      for (TaskModel task in allTasks) {
        if (task.category == cat.name && isSameDay(DateTime.now(), datetime)) {
          tasks.add(task);
        }
      }
      emit(TasksOfCategoreySuccessed());
      return tasks;
    } catch (_) {
      emit(TasksOfCategoreyFailed(errMessage: "Error"));
    }
    return [];
  }
}
