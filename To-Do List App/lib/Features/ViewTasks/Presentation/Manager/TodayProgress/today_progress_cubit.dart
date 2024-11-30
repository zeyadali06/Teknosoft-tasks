import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/FetchTasksRepo.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/MidNightRefreshRepo.dart';

part 'today_progress_state.dart';

class TodayProgressCubit extends Cubit<TodayProgressState> {
  TodayProgressCubit(this.fetchTasksRepo, this.midHightRefresherRepo) : super(TodayProgressInitial());

  List<TaskModel> tasks = [];
  final FetchTasksRepo fetchTasksRepo;
  final MidHightRefresherRepo midHightRefresherRepo;

  List<TaskModel> getTodayFinishedTasks() {
    Result res = fetchTasksRepo.fetchTodayFinishedTasks();

    if (res is ResultSuccess) {
      tasks = res.data;
      emit(TodayProgressSuccess());
      return tasks;
    } else if (res is ResultFailure) {
      emit(TodayProgressFailed(errMessage: res.failure.message));
    }
    return [];
  }

  void startMidNightTimer() {
    midHightRefresherRepo.refresh(() => getTodayFinishedTasks());
  }
}
