import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'tasks_of_categorey_state.dart';

class TasksOfCategoreyCubit extends Cubit<TasksOfCategoreyState> {
  TasksOfCategoreyCubit() : super(TasksOfCategoreyInitial());

  DateTime whenRefreshDateTime = DateTime.now();
  late DateTime timerDateTime;
  late List<TaskModel> tasks;

  List<TaskModel> getTasks(DateTime datetime, Category cat) {
    try {
      List<TaskModel> allTasks = getData();
      List<TaskModel> res = [];

      for (TaskModel task in allTasks) {
        if (task.category == cat.name && isSameDay(datetime, task.from)) {
          res.add(task);
        }
      }
      tasks = res;
      emit(TasksOfCategoreySuccessed());
      return tasks;
    } catch (_) {
      emit(TasksOfCategoreyFailed(errMessage: "Error, try again later!"));
    }
    return [];
  }

  void startMidNightTimer(Category cat) {
    final DateTime now = DateTime.now();
    final DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final Duration duration = nextMidnight.difference(now);
    Timer(duration, () => getTasks(timerDateTime, cat));
  }
}
