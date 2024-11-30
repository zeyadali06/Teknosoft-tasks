import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/FetchTasksRepo.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/MidNightRefreshRepo.dart';

part 'upcoming_tasks_state.dart';

class UpcomingTasksCubit extends Cubit<UpcomingTasksState> {
  UpcomingTasksCubit(this.fetchTasksRepo, this.midHightRefresherRepo) : super(UpcomingTasksInitial());

  late DateTime timerDateTime;
  DateTime whenRefreshDateTime = DateTime.now();
  List<TaskModel> tasks = [];
  final FetchTasksRepo fetchTasksRepo;
  final MidHightRefresherRepo midHightRefresherRepo;

  List<TaskModel> getUpcomingTasks(DateTime datetime) {
    Result res = fetchTasksRepo.fetchUpcomingTasks(datetime);

    if (res is ResultSuccess) {
      tasks = res.data;
      emit(UpcomingTasksSuccessed());
      return tasks;
    } else if (res is ResultFailure) {
      emit(UpcomingTasksFailed(errMessage: res.failure.message));
    }

    return [];
  }

  void startMidNightTimer() {
    midHightRefresherRepo.refresh(() => getUpcomingTasks(timerDateTime));
  }
}
