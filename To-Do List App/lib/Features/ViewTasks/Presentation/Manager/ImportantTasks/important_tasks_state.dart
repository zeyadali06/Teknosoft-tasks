part of 'important_tasks_cubit.dart';

@immutable
sealed class ImportantTasksState {}

final class ImportantTasksInitial extends ImportantTasksState {}

final class ImportantTasksSuccessed extends ImportantTasksState {}

final class ImportantTasksLoading extends ImportantTasksState {}

final class ImportantTasksFailed extends ImportantTasksState {
  ImportantTasksFailed({required this.errMessage});

  final String errMessage;
}
