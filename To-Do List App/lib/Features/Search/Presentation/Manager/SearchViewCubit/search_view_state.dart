part of 'search_view_cubit.dart';

@immutable
sealed class SearchViewState {}

final class SearchViewInitial extends SearchViewState {}

final class SearchViewFind extends SearchViewState {
  SearchViewFind(this.tasks);

  final List<TaskModel> tasks;
}

final class SearchViewNotFound extends SearchViewState {}
