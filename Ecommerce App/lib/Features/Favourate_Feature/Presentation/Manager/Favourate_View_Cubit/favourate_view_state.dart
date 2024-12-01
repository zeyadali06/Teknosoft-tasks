part of 'favourate_view_cubit.dart';

@immutable
sealed class FavourateViewState {}

final class FavourateViewInitial extends FavourateViewState {}

final class FavourateViewSuccessed extends FavourateViewState {}

final class FavourateViewLoading extends FavourateViewState {}

final class FavourateViewEmpty extends FavourateViewState {}

final class FavourateViewFailed extends FavourateViewState {
  final String errMessage;

  FavourateViewFailed(this.errMessage);
}
