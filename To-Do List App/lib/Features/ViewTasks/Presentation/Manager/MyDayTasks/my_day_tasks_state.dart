part of 'my_day_tasks_cubit.dart';

@immutable
sealed class MyDayTasksState {}

final class MyDayTasksInitial extends MyDayTasksState {}

final class MyDayTasksSuccess extends MyDayTasksState {}

final class MyDayTasksFailed extends MyDayTasksState {
  MyDayTasksFailed({required this.errMessage});

  final String errMessage;
}
