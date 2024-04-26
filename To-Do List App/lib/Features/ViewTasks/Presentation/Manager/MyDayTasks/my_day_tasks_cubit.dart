import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'my_day_tasks_state.dart';

class MyDayTasksCubit extends Cubit<MyDayTasksState> {
  MyDayTasksCubit() : super(MyDayTasksInitial());

  List<TaskModel> getMyDayTasks() {
    emit(MyDayTasksLoading());
    try {
      emit(MyDayTasksLoading());
      List<TaskModel> tasks = getData();
      List<TaskModel> res = [];

      for (TaskModel task in tasks) {
        if (task.from.day == DateTime.now().day && task.from.month == DateTime.now().month && task.from.year == DateTime.now().year) {
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
