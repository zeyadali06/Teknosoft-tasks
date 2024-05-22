part of 'cart_view_cubit.dart';

@immutable
sealed class CartViewState {}

final class CartViewInitial extends CartViewState {}

final class CartViewLoading extends CartViewState {}

final class CartViewEmpty extends CartViewState {}

final class CartViewSuccessed extends CartViewState {}

final class CartViewFailed extends CartViewState {
  final String errMessage;

  CartViewFailed(this.errMessage);
}
