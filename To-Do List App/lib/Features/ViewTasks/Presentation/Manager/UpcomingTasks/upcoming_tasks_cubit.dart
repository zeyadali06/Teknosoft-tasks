import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'upcoming_tasks_state.dart';

class UpcomingTasksCubit extends Cubit<UpcomingTasksState> {
  UpcomingTasksCubit() : super(UpcomingTasksInitial());

  late DateTime datetime;
  List<TaskModel> tasks = [];

  List<TaskModel> getTasks(DateTime datetime) {
    try {
      List<TaskModel> allTasks = getData();
      List<TaskModel> res = [];

      for (TaskModel task in allTasks) {
        if (isSameDay(datetime, task.from)) {
          res.add(task);
        }
      }
      tasks = res;
      emit(UpcomingTasksSuccessed());
      return res;
    } catch (e) {
      emit(UpcomingTasksFailed(errMessage: "Error, try again later!"));
    }
    return [];
  }

  void startMidNightTimer() {
    final DateTime now = DateTime.now();
    final DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final Duration duration = nextMidnight.difference(now);
    Timer(duration, () => getTasks(datetime));
  }
}
