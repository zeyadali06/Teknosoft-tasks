import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_view_state.dart';

class ShoppingViewCubit extends Cubit<ShoppingViewState> {
  ShoppingViewCubit(this.repo) : super(ShoppingViewInitial());

  final ShoppingRepoImplement repo;
  String selectedBrand = "All";

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> result = [];
    try {
      emit(ShoppingViewLoading());
      var res = await repo.getAllProducts();
      res.fold(
        (l) {
          return emit(ShoppingViewFailed(errMessage: l.errMessage));
        },
        (r) {
          result = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.allProducts = result;
    } catch (e) {
      emit(ShoppingViewFailed(errMessage: AuthFailure(e).errMessage));
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
          return emit(ShoppingViewFailed(errMessage: l.errMessage));
        },
        (r) {
          result = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.avaliableProducts = result;
    } catch (e) {
      emit(ShoppingViewFailed(errMessage: AuthFailure(e).errMessage));
    }
    return result;
  }

  List<String> getBrands(List<ProductModel> allProds) {
    List<String> brands = [];
    try {
      emit(ShoppingViewLoading());
      var res = repo.getBrands(allProds);
      res.fold(
        (l) {
          return emit(ShoppingViewFailed(errMessage: l.errMessage));
        },
        (r) {
          brands = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.allBrands = brands;
    } catch (e) {
      emit(ShoppingViewFailed(errMessage: AuthFailure(e).errMessage));
    }
    return brands;
  }

  List<ProductModel> getSpecificBrandProducts(List<ProductModel> allProds, String brand) {
    if (brand == "All") {
      repo.specificBrandProducts = allProds;
      emit(ShoppingViewSuccessed());
      return allProds;
    }

    List<ProductModel> products = [];
    try {
      Either<Failure, List<ProductModel>> res;
      emit(ShoppingViewLoading());

      res = repo.getSpecificBrandProducts(allProds, brand);

      res.fold(
        (l) {
          return emit(ShoppingViewFailed(errMessage: l.errMessage));
        },
        (r) {
          products = r;
        },
      );

      emit(ShoppingViewSuccessed());
      repo.specificBrandProducts = products;
    } catch (e) {
      emit(ShoppingViewFailed(errMessage: AuthFailure(e).errMessage));
    }
    return products;
  }

  Future<ProductModel?> getProduct(int id) async {
    ProductModel? product;
    try {
      emit(ShoppingViewLoading());
      var res = await repo.getAllProducts();
      res.fold((l) {
        throw l;
      }, (r) {
        for (ProductModel prod in r) {
          if (prod.id == id) {
            product = prod;
            emit(ShoppingViewSuccessed());
            break;
          }
        }
      });
    } catch (e) {
      emit(ShoppingViewFailed(errMessage: AuthFailure(e).errMessage));
    }
    return product;
  }
}
