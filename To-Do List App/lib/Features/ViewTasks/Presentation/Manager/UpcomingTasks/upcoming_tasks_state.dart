part of 'upcoming_tasks_cubit.dart';

@immutable
sealed class UpcomingTasksState {}

final class UpcomingTasksInitial extends UpcomingTasksState {}

final class UpcomingTasksLoading extends UpcomingTasksState {}

final class UpcomingTasksFailed extends UpcomingTasksState {
  UpcomingTasksFailed({required this.errMessage});

  final String errMessage;
}

final class UpcomingTasksSuccessed extends UpcomingTasksState {}
