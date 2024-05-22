import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Favouraties.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'favourate_view_state.dart';

class FavourateViewCubit extends Cubit<FavourateViewState> {
  FavourateViewCubit(this.repo) : super(FavourateViewInitial());

  late List<ProductModel> favourateProdcts;
  ShoppingRepoImplement repo;

  Future<List<ProductModel>> getFavouratProduct() async {
    List<ProductModel> finalRes = [];
    try {
      emit(FavourateViewLoading());
      List<int>? fav = await getFavouraties();
      var res = await repo.getAllProducts();

      fav ??= [];

      res.fold(
        (l) {
          throw l;
        },
        (r) {
          for (ProductModel prod in r) {
            if (fav!.contains(prod.id)) {
              finalRes.add(prod);
            }
          }
        },
      );

      favourateProdcts = finalRes;
      if (finalRes.isEmpty) {
        emit(FavourateViewEmpty());
      } else {
        emit(FavourateViewSuccessed());
      }
    } catch (e) {
      try {
        emit(FavourateViewFailed(AuthFailure(e).errMessage));
      } catch (_) {}
    }
    return finalRes;
  }

  Future<void> changeFavourateStatus(ProductModel product, bool status) async {
    try {
      emit(FavourateViewLoading());
      await editFavouraties(product.id, status);
      product.favourate = !product.favourate;

      emit(FavourateViewSuccessed());
    } catch (e) {
      try {
        emit(FavourateViewFailed(AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }
}
