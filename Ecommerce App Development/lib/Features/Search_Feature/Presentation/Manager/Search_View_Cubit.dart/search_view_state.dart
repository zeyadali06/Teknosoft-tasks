part of 'search_view_cubit.dart';

@immutable
sealed class SearchViewState {}

final class SearchViewInitial extends SearchViewState {}

final class SearchViewLoading extends SearchViewState {}

final class SearchViewSuccessed extends SearchViewState {}

final class SearchViewEmpty extends SearchViewState {}

final class SearchViewFailed extends SearchViewState {
  final String errMessage;

  SearchViewFailed(this.errMessage);
}
