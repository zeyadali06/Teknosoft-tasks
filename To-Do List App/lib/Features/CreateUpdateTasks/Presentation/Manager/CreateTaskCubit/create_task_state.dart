part of 'create_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskSuccessed extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskFailed extends AddTaskState {
  AddTaskFailed({required this.errMessage});

  final String errMessage;
}
