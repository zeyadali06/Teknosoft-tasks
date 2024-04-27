import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'my_day_tasks_state.dart';

class MyDayTasksCubit extends Cubit<MyDayTasksState> {
  MyDayTasksCubit() : super(MyDayTasksInitial());

  List<TaskModel> getMyDayTasks() {
    try {
      emit(MyDayTasksLoading());
      emit(MyDayTasksLoading());
      List<TaskModel> tasks = getData();
      List<TaskModel> res = [];

      for (TaskModel task in tasks) {
        if (isSameDay(DateTime.now(), task.from)) {
          res.add(task);
        }
      }
      emit(MyDayTasksSuccess());
      return res;
    } catch (_) {
      emit(MyDayTasksFailed(errMessage: "Error, try again later!"));
      return [];
    }
  }
}
