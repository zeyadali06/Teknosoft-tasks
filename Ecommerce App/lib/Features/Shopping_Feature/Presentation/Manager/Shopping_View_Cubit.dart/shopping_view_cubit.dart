import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Fauiler.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_view_state.dart';

class ShoppingViewCubit extends Cubit<ShoppingViewState> {
  ShoppingViewCubit(this.repo) : super(ShoppingViewInitial());

  final ShoppingRepoImplement repo;
  String selectedCategory = "All";

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> result = [];
    try {
      emit(ShoppingViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ShoppingViewFailed("No Internet Connection"));
        return [];
      }
      var res = await repo.getAllProducts();
      res.fold(
        (l) {
          return emit(ShoppingViewFailed(l.errMessage));
        },
        (r) {
          result = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.allProducts = result;
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ShoppingViewFailed("No Internet Connection"));
      } else {
        emit(ShoppingViewFailed(AuthFailure(e).errMessage));
      }
    }
    return result;
  }

  List<ProductModel> getAvaliableProducts(List<ProductModel> allProds) {
    List<ProductModel> result = [];
    try {
      emit(ShoppingViewLoading());
      var res = repo.getAvaliableProducts(allProds);
      res.fold(
        (l) {
          return emit(ShoppingViewFailed(l.errMessage));
        },
        (r) {
          result = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.avaliableProducts = result;
    } catch (e) {
      emit(ShoppingViewFailed(AuthFailure(e).errMessage));
    }
    return result;
  }

  List<String> getCategories(List<ProductModel> allProds) {
    List<String> categories = [];
    try {
      emit(ShoppingViewLoading());
      var res = repo.getCategories(allProds);
      res.fold(
        (l) {
          return emit(ShoppingViewFailed(l.errMessage));
        },
        (r) {
          categories = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.allCategories = categories;
    } catch (e) {
      emit(ShoppingViewFailed(AuthFailure(e).errMessage));
    }
    return categories;
  }

  List<ProductModel> getSpecificCategoryProducts(List<ProductModel> allProds, String category) {
    if (category == "All") {
      repo.specificCategoryProducts = allProds;
      emit(ShoppingViewSuccessed());
      return allProds;
    }

    List<ProductModel> products = [];
    try {
      Either<Failure, List<ProductModel>> res;
      emit(ShoppingViewLoading());

      res = repo.getSpecificCategoryProducts(allProds, category);

      res.fold(
        (l) {
          return emit(ShoppingViewFailed(l.errMessage));
        },
        (r) {
          products = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.specificCategoryProducts = products;
    } catch (e) {
      emit(ShoppingViewFailed(AuthFailure(e).errMessage));
    }
    return products;
  }

  Future<ProductModel?> getProduct(int id) async {
    ProductModel? product;
    try {
      emit(ShoppingViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ShoppingViewFailed("No Internet Connection"));
        return null;
      }
      var res = await repo.getAllProducts();
      res.fold((l) {
        throw l;
      }, (r) {
        for (ProductModel prod in r) {
          if (prod.id == id) {
            product = prod;
            break;
          }
        }
      });
      emit(ShoppingViewSuccessed());
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(ShoppingViewFailed("No Internet Connection"));
      } else {
        emit(ShoppingViewFailed(AuthFailure(e).errMessage));
      }
    }
    return product;
  }
}
