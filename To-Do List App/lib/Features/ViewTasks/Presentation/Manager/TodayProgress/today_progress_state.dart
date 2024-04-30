part of 'today_progress_cubit.dart';

@immutable
sealed class TodayProgressState {}

final class TodayProgressInitial extends TodayProgressState {}

final class TodayProgressSuccess extends TodayProgressState {}

final class TodayProgressFailed extends TodayProgressState {
  TodayProgressFailed({required this.errMessage});

  final String errMessage;
}
