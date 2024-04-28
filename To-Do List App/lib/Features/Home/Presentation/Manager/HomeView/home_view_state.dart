part of 'home_view_cubit.dart';

@immutable
sealed class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}

final class HomeViewSuccessed extends HomeViewState {}

final class HomeViewFailed extends HomeViewState {
  HomeViewFailed({required this.errMessage});

  final String errMessage;
}
