import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Favouraties.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Cart.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  Future<void> changeFavourateStatus(ProductModel product, bool status) async {
    try {
      emit(ProductDetailsLoading());
      await editFavouraties(product.id, status);
      emit(ProductDetailsFavourateSuccessed());
    } catch (e) {
      try {
        emit(ProductDetailsFailed(errMessage: AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }

  Future<void> addToCart(ProductModel product, int numberOfItems) async {
    try {
      emit(ProductDetailsLoading());
      if (numberOfItems == 0) {
        emit(ProductDetailsCartNOItemsEqualZero());
        return;
      }
      await addItemToCart(product.id, numberOfItems);
      emit(ProductDetailsCartSuccessed());
    } catch (e) {
      try {
        emit(ProductDetailsFailed(errMessage: AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }
}
