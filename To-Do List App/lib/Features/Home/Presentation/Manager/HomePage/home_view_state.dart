part of 'home_view_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class HomePageSuccessed extends HomePageState {}

final class HomePageFailed extends HomePageState {
  HomePageFailed({required this.errMessage});

  final String errMessage;
}

final class HomePageLoading extends HomePageState {}
