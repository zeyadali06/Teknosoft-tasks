import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/FetchTasksRepo.dart';
import 'package:todo_list_app/Features/ViewTasks/Domain/RepoInterface/MidNightRefreshRepo.dart';

part 'tasks_of_categorey_state.dart';

class TasksOfCategoreyCubit extends Cubit<TasksOfCategoreyState> {
  TasksOfCategoreyCubit(this.fetchTasksRepo, this.midHightRefresherRepo) : super(TasksOfCategoreyInitial());

  DateTime whenRefreshDateTime = DateTime.now();
  late DateTime timerDateTime;
  late List<TaskModel> tasks;
  final FetchTasksRepo fetchTasksRepo;
  final MidHightRefresherRepo midHightRefresherRepo;

  List<TaskModel> getSpecificCategoryTasks(DateTime datetime, Category category) {
    Result res = fetchTasksRepo.fetchSpecificCategoryTasks(datetime, category);

    if (res is ResultSuccess) {
      tasks = res.data;
      emit(TasksOfCategoreySuccessed());
      return tasks;
    } else if (res is ResultFailure) {
      emit(TasksOfCategoreyFailed(errMessage: res.failure.message));
    }

    return [];
  }

  void startMidNightTimer(Category cat) {
    midHightRefresherRepo.refresh(() => getSpecificCategoryTasks(timerDateTime, cat));
  }
}
