part of 'tasks_of_categorey_cubit.dart';

@immutable
sealed class TasksOfCategoreyState {}

final class TasksOfCategoreyInitial extends TasksOfCategoreyState {}

final class TasksOfCategoreySuccessed extends TasksOfCategoreyState {}

final class TasksOfCategoreyFailed extends TasksOfCategoreyState {
  TasksOfCategoreyFailed({required this.errMessage});

  final String errMessage;
}
