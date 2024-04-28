import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'important_tasks_state.dart';

class ImportantTasksCubit extends Cubit<ImportantTasksState> {
  ImportantTasksCubit() : super(ImportantTasksInitial());
  List<TaskModel> tasks = [];

  List<TaskModel> getTasks(DateTime datetime) {
    try {
      List<TaskModel> allTasks = getData();
      tasks.clear();

      for (TaskModel task in allTasks) {
        if (isSameDay(datetime, task.from)) {
          if (task.important) {
            tasks.add(task);
          }
        }
      }
      emit(ImportantTasksSuccessed());
      return tasks;
    } catch (e) {
      emit(ImportantTasksFailed(errMessage: "Error, try again later!"));
    }
    return [];
  }
}
