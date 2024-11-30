import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/FetchTasksRepo.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/MidNightRefreshRepo.dart';

part 'important_tasks_state.dart';

class ImportantTasksCubit extends Cubit<ImportantTasksState> {
  ImportantTasksCubit(this.fetchTasksRepo, this.midHightRefresherRepo) : super(ImportantTasksInitial());

  late DateTime timerDateTime;
  DateTime whenRefreshDateTime = DateTime.now();
  late List<TaskModel> tasks;
  final FetchTasksRepo fetchTasksRepo;
  final MidHightRefresherRepo midHightRefresherRepo;

  List<TaskModel> getImportantTasks(DateTime datetime) {
    Result res = fetchTasksRepo.fetchImportantTasks(datetime);

    if (res is ResultSuccess) {
      tasks = res.data;
      emit(ImportantTasksSuccessed());
      return tasks;
    } else if (res is ResultFailure) {
      emit(ImportantTasksFailed(errMessage: res.failure.message));
    }

    return [];
  }

  void startMidNightTimer() {
    midHightRefresherRepo.refresh(() => getImportantTasks(timerDateTime));
  }
}
