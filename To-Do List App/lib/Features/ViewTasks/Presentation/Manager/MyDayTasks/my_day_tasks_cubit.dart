import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/FetchTasksRepo.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/MidNightRefreshRepo.dart';

part 'my_day_tasks_state.dart';

class MyDayTasksCubit extends Cubit<MyDayTasksState> {
  MyDayTasksCubit(this.fetchTasksRepo, this.midHightRefresherRepo) : super(MyDayTasksInitial());

  List<TaskModel> tasks = [];
  final FetchTasksRepo fetchTasksRepo;
  final MidHightRefresherRepo midHightRefresherRepo;

  List<TaskModel> getMyDayTasks() {
    Result res = fetchTasksRepo.fetchMyDayTasks();

    if (res is ResultSuccess) {
      tasks = res.data;
      emit(MyDayTasksSuccess());
      return tasks;
    } else if (res is ResultFailure) {
      emit(MyDayTasksFailed(errMessage: res.failure.message));
    }

    return [];
  }

  void startMidNightTimer() {
    midHightRefresherRepo.refresh(() => getMyDayTasks());
  }
}
