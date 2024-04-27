import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'upcoming_tasks_state.dart';

class UpcomingTasksCubit extends Cubit<UpcomingTasksState> {
  UpcomingTasksCubit() : super(UpcomingTasksInitial());

  List<TaskModel> tasks = [];

  List<TaskModel> getTasks(DateTime datetime) {
    try {
      emit(UpcomingTasksLoading());
      List<TaskModel> allTasks = getData();
      tasks.clear();

      for (TaskModel task in allTasks) {
        if (task.from.day == datetime.day && task.from.month == datetime.month && task.from.year == datetime.year) {
          tasks.add(task);
        }
      }
      emit(UpcomingTasksSuccessed());
      return tasks;
    } catch (e) {
      emit(UpcomingTasksFailed(errMessage: "Error"));
    }
    return [];
  }
}
