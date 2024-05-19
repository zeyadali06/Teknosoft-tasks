part of 'shopping_view_cubit.dart';

@immutable
sealed class ShoppingViewState {}

final class ShoppingViewInitial extends ShoppingViewState {}

final class ShoppingViewAvaliableLoading extends ShoppingViewState {}

final class ShoppingViewAvaliableSuccessed extends ShoppingViewState {}

final class ShoppingViewAvaliableNoDataFound extends ShoppingViewState {}

final class ShoppingViewAvaliableFailed extends ShoppingViewState {
  final String errMessage;

  ShoppingViewAvaliableFailed({required this.errMessage});
}

final class ShoppingViewBrandsLoading extends ShoppingViewState {}

final class ShoppingViewBrandsSuccessed extends ShoppingViewState {}

final class ShoppingViewBrandsNoDataFound extends ShoppingViewState {}

final class ShoppingViewBrandsFailed extends ShoppingViewState {
  final String errMessage;

  ShoppingViewBrandsFailed({required this.errMessage});
}

final class ShoppingViewSpecificLoading extends ShoppingViewState {}

final class ShoppingViewSpecificSuccessed extends ShoppingViewState {}

final class ShoppingViewSpecificNoDataFound extends ShoppingViewState {}

final class ShoppingViewSpecificFailed extends ShoppingViewState {
  final String errMessage;

  ShoppingViewSpecificFailed({required this.errMessage});
}
