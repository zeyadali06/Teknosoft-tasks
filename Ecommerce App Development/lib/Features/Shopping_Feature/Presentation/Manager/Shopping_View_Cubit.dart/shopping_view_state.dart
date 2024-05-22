part of 'shopping_view_cubit.dart';

@immutable
sealed class ShoppingViewState {}

final class ShoppingViewInitial extends ShoppingViewState {}

final class ShoppingViewLoading extends ShoppingViewState {}

final class ShoppingViewSuccessed extends ShoppingViewState {}

final class ShoppingViewFailed extends ShoppingViewState {
  final String errMessage;

  ShoppingViewFailed(this.errMessage);
}
