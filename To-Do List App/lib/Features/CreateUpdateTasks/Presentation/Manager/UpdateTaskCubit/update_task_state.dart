part of 'update_task_cubit.dart';

@immutable
sealed class UpdateTaskState {}

final class UpdateTaskInitial extends UpdateTaskState {}

final class UpdateTaskSuccessed extends UpdateTaskState {}

final class UpdateTaskLoading extends UpdateTaskState {}

final class UpdateTaskFailed extends UpdateTaskState {
  UpdateTaskFailed({required this.errMessage});

  final String errMessage;
}
