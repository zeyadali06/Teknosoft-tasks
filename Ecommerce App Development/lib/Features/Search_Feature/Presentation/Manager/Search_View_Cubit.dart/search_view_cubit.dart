import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'search_view_state.dart';

class SearchViewCubit extends Cubit<SearchViewState> {
  SearchViewCubit(this.repo) : super(SearchViewInitial());

  ShoppingRepoImplement repo;
  late List<ProductModel> products;
  late List<ProductModel> filteredProducts;

  Future<List<ProductModel>> getAllPoducts() async {
    List<ProductModel> finalRes = [];
    try {
      emit(SearchViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(SearchViewFailed("No Internet Connection"));
        return [];
      }
      var res = await repo.getAllProducts();

      res.fold((l) {
        throw l;
      }, (r) {
        finalRes = r;
        for (ProductModel prod in finalRes) {
          prod.lowerTitle = prod.title.toLowerCase();
        }
      });

      products = finalRes;
      filteredProducts = finalRes;
      emit(SearchViewSuccessed());
    } catch (e) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(SearchViewFailed("No Internet Connection"));
        } else {
          emit(SearchViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
    return finalRes;
  }

  List<ProductModel> search(String searchFor) {
    List<ProductModel> finalRes = [];
    try {
      if (searchFor == "" || searchFor.isEmpty) {
        filteredProducts = products;
        emit(SearchViewSuccessed());
        return filteredProducts;
      }

      String text = searchFor.toLowerCase();
      for (ProductModel product in products) {
        if (product.lowerTitle.contains(text)) {
          finalRes.add(product);
        }
      }

      if (finalRes.isEmpty) {
        filteredProducts = [];
        emit(SearchViewEmpty());
      } else {
        filteredProducts = finalRes;
        emit(SearchViewSuccessed());
      }
    } catch (e) {
      try {
        emit(SearchViewFailed(AuthFailure(e).errMessage));
      } catch (_) {}
    }
    return filteredProducts;
  }
}
