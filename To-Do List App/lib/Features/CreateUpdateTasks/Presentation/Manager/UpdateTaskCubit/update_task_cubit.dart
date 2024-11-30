import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/CategoryEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/PriorityEnum.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Domain/RepoInterface/TaskManagementRepo.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.repo) : super(UpdateTaskInitial());

  final TaskManagementRepo repo;

  late TaskModel task;
  DateTime? enteredDate;
  TimeOfDay? enteredTime;
  Category category = Category.firstItem;
  Priority priority = Priority.firstItem;

  Future<void> saveTask() async {
    emit(UpdateTaskLoading());

    Result res = await repo.updateTask(task, category, priority);

    if (res is ResultSuccess) {
      emit(UpdateTaskSuccessed());
    } else if (res is ResultFailure) {
      emit(UpdateTaskFailed(errMessage: res.failure.message));
    }
  }
}
