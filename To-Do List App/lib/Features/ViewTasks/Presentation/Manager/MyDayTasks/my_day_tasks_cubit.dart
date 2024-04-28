import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'my_day_tasks_state.dart';

class MyDayTasksCubit extends Cubit<MyDayTasksState> {
  MyDayTasksCubit() : super(MyDayTasksInitial());

  List<TaskModel> tasks = [];

  List<TaskModel> getMyDayTasks() {
    try {
      List<TaskModel> res = [];

      for (TaskModel task in getData()) {
        if (isSameDay(DateTime.now(), task.from)) {
          res.add(task);
        }
      }
      tasks = res;
      emit(MyDayTasksSuccess());
      return res;
    } catch (_) {
      emit(MyDayTasksFailed(errMessage: "Error, try again later!"));
      return [];
    }
  }

  void startMidNightTimer() {
    final DateTime now = DateTime.now();
    final DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final Duration duration = nextMidnight.difference(now);
    Timer(duration, () => getMyDayTasks());
  }
}
