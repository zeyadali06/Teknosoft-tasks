part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsFavourateSuccessed extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsFavourateFailed extends ProductDetailsState {
  final String errMessage;

  ProductDetailsFavourateFailed({required this.errMessage});
}

final class ProductDetailsCartSuccessed extends ProductDetailsState {}

final class ProductDetailsCartFailed extends ProductDetailsState {
  final String errMessage;

  ProductDetailsCartFailed({required this.errMessage});
}
