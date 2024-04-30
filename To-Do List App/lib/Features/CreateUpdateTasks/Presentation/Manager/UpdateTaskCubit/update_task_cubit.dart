import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitial());
  late TaskModel task;
  DateTime? enteredDate;
  TimeOfDay? enteredTime;

  Future<void> saveTask() async {
    try {
      if (task.from.isAfter(task.to)) {
        emit(UpdateTaskFailed(errMessage: "End Date should be after Start Date"));
        return;
      }

      if (task.from == task.to) {
        emit(UpdateTaskFailed(errMessage: "Start Date shouldn't equal to End Date"));
        return;
      }

      emit(UpdateTaskLoading());
      await task.save();
      emit(UpdateTaskSuccessed());
    } catch (_) {
      emit(UpdateTaskFailed(errMessage: "Error"));
    }
  }
}
