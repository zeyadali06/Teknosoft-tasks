part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsFavourateSuccessed extends ProductDetailsState {}

final class ProductDetailsCartSuccessed extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsNOItemsEqualZero extends ProductDetailsState {}

final class ProductDetailsFailed extends ProductDetailsState {
  final String errMessage;

  ProductDetailsFailed({required this.errMessage});
}
