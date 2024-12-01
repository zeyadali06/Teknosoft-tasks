import 'package:e_commerce_app/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Fetch_Favouraties.dart';
import 'package:e_commerce_app/Core/Error/Fauiler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'favourate_view_state.dart';

class FavourateViewCubit extends Cubit<FavourateViewState> {
  FavourateViewCubit(this.repo) : super(FavourateViewInitial());

  late List<ProductModel> favourateProdcts;
  ShoppingRepoImplement repo;

  Future<List<ProductModel>> getFavouratProducts() async {
    List<ProductModel> finalRes = [];
    try {
      emit(FavourateViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(FavourateViewFailed("No Internet Connection"));
        return [];
      }

      List<int>? fav = await getFavouraties();

      if (fav == null || fav.isEmpty) {
        emit(FavourateViewEmpty());
        return [];
      }

      var res = await repo.getAllProducts();

      res.fold(
        (l) {
          throw l;
        },
        (r) {
          for (ProductModel prod in r) {
            if (fav.contains(prod.id)) {
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
        bool connStat = await checkConn();
        if (!connStat) {
          emit(FavourateViewFailed("No Internet Connection"));
        } else {
          emit(FavourateViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
    return finalRes;
  }

  Future<void> changeFavourateStatus(ProductModel product, bool status) async {
    try {
      emit(FavourateViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(FavourateViewFailed("No Internet Connection"));
        return;
      }
      await editFavouraties(product.id, status);
      product.favourate = !product.favourate;

      emit(FavourateViewSuccessed());
    } catch (e) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(FavourateViewFailed("No Internet Connection"));
        } else {
          emit(FavourateViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
  }
}
