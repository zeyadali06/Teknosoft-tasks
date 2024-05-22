// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Capitalize_String.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Favouraties.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Cart.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ShoppingRepoImplement implements ShoppingRepo {
  late List<ProductModel> allProducts;
  late List<ProductModel> avaliableProducts;
  late List<ProductModel> specificBrandProducts;
  late List<String> allBrands;

  @override
  Either<Failure, List<ProductModel>> getAvaliableProducts(List<ProductModel> allProducts) {
    try {
      List<ProductModel> res = [];

      for (ProductModel prod in allProducts) {
        if (prod.stock > 0) {
          res.add(prod);
        }
      }

      avaliableProducts = res;
      return right(res);
    } catch (e) {
      if (e is AuthFailure) {
        return left(e);
      } else {
        return left(AuthFailure(e));
      }
    }
  }

  @override
  Either<Failure, List<ProductModel>> getSpecificBrandProducts(List<ProductModel> allProducts, String brand) {
    try {
      List<ProductModel> res = [];

      for (ProductModel prod in allProducts) {
        if (prod.brand == brand) {
          res.add(prod);
        }
      }

      specificBrandProducts = res;
      return right(res);
    } catch (e) {
      if (e is AuthFailure) {
        return left(e);
      } else {
        return left(AuthFailure(e));
      }
    }
  }

  @override
  Either<Failure, List<String>> getBrands(List<ProductModel> allProducts) {
    try {
      List<String> brands = [];

      brands.add("All");
      for (ProductModel prod in allProducts) {
        if (!brands.contains(capitalizeEachWord(prod.brand.trim()))) {
          brands.add(capitalizeEachWord(prod.brand.trim()));
        }
      }

      allBrands = brands;
      return right(brands);
    } catch (e) {
      if (e is AuthFailure) {
        return left(e);
      } else {
        return left(AuthFailure(e));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      Dio dio = Dio();
      Response<dynamic> response = await dio.get("https://dummyjson.com/products");
      List<ProductModel> products = [];
      dynamic productsAsJson = response.data["products"];

      for (dynamic json in productsAsJson) {
        ProductModel product = ProductModel.fromJson(json);
        products.add(product);
      }

      List<int>? favourates = await getFavouraties();
      if (favourates != null) {
        for (ProductModel prod in products) {
          if (favourates.contains(prod.id)) {
            prod.favourate = true;
          }
        }
      }

      Map<String, int>? itemsInCart = await getCartItems();
      if (itemsInCart != null) {
        for (ProductModel product in products) {
          if (itemsInCart.containsKey(id.toString())) {
            product.itemsInCart = itemsInCart[id.toString()]!;
          }
        }
      }

      allProducts = products;
      return right(products);
    } catch (e) {
      return left(AuthFailure(e));
    }
  }
}
