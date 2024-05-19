import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shopping_view_state.dart';

class ShoppingViewCubit extends Cubit<ShoppingViewState> {
  ShoppingViewCubit(this.repo) : super(ShoppingViewInitial());

  final ShoppingRepo repo;
  late List<ProductModel> avaliableProducts;
  late List<ProductModel> specificBrandProducts;
  late List<String> allBrands;
  String selectedBrand = "All";

  Future<List<ProductModel>> getAvaliableProducts() async {
    List<ProductModel> products = [];
    emit(ShoppingViewAvaliableLoading());
    var res = await repo.getAvaliableProducts();
    res.fold(
      (l) {
        return emit(ShoppingViewAvaliableFailed(errMessage: l.errMessage));
      },
      (r) {
        products = r;
      },
    );
    if (products.isEmpty) {
      emit(ShoppingViewAvaliableNoDataFound());
    } else {
      emit(ShoppingViewAvaliableSuccessed());
    }
    avaliableProducts = products;
    return products;
  }

  Future<List<String>> getBrands() async {
    List<String> brands = [];
    emit(ShoppingViewBrandsLoading());
    var res = await repo.getBrands();
    res.fold(
      (l) {
        return emit(ShoppingViewBrandsFailed(errMessage: l.errMessage));
      },
      (r) {
        brands = r;
      },
    );
    if (brands.isEmpty) {
      emit(ShoppingViewBrandsNoDataFound());
    } else {
      emit(ShoppingViewBrandsSuccessed());
    }
    allBrands = brands;
    return brands;
  }

  Future<List<ProductModel>> getSpecificBrandProducts(String brand) async {
    List<ProductModel> products = [];
    Either<Failure, List<ProductModel>> res;
    emit(ShoppingViewSpecificLoading());

    if (brand == "All") {
      res = await repo.getAllProducts();
    } else {
      res = await repo.getSpecificBrandProducts(brand);
    }

    res.fold(
      (l) {
        return emit(ShoppingViewSpecificFailed(errMessage: l.errMessage));
      },
      (r) {
        products = r;
      },
    );

    if (products.isEmpty) {
      emit(ShoppingViewSpecificNoDataFound());
    } else {
      emit(ShoppingViewSpecificSuccessed());
    }

    specificBrandProducts = products;
    return products;
  }
}
