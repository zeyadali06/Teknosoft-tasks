// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/FirebaseFirestoreServices.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Capitalize_String.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_List.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:e_commerce_app_development/main.dart';

class ShoppingRepoImplement implements ShoppingRepo {
  @override
  Future<Either<AuthFailure, List<ProductModel>>> getAvaliableProducts() async {
    try {
      List<ProductModel> ret = [];
      List<ProductModel> products = [];
      Either<Failure, List<ProductModel>> response = await getAllProducts();

      response.fold(
        (l) {
          throw l;
        },
        (r) {
          ret = r;
        },
      );

      for (ProductModel prod in ret) {
        if (prod.stock > 0) {
          products.add(prod);
        }
      }

      return right(products);
    } catch (e) {
      if (e is AuthFailure) {
        return left(e);
      } else {
        return left(AuthFailure(e));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getSpecificBrandProducts(String brand) async {
    try {
      List<ProductModel> ret = [];
      List<ProductModel> products = [];
      Either<Failure, List<ProductModel>> response = await getAllProducts();

      response.fold(
        (l) {
          throw l;
        },
        (r) {
          ret = r;
        },
      );

      for (ProductModel prod in ret) {
        if (prod.brand == brand) {
          products.add(prod);
        }
      }

      return right(products);
    } catch (e) {
      if (e is AuthFailure) {
        return left(e);
      } else {
        return left(AuthFailure(e));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getBrands() async {
    try {
      List<ProductModel> ret = [];
      List<String> brands = [];
      Either<Failure, List<ProductModel>> response = await getAllProducts();
      response.fold(
        (l) {
          throw l;
        },
        (r) {
          ret = r;
        },
      );

      brands.add("All");
      for (ProductModel prod in ret) {
        if (!brands.contains(capitalizeEachWord(prod.brand.trim()))) {
          brands.add(capitalizeEachWord(prod.brand.trim()));
        }
      }

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

      var result = await DataBase.getField(collectionPath: favourateCollection, docName: allUserData!.uid, key: favouratesField);
      List<int> favourates = convertToList(result)!;
      if (favourates.isNotEmpty) {
        for (ProductModel prod in products) {
          if (favourates.contains(prod.id)) {
            prod.favourate = true;
          }
        }
      }

      return right(products);
    } catch (e) {
      return left(AuthFailure(e));
    }
  }
}
