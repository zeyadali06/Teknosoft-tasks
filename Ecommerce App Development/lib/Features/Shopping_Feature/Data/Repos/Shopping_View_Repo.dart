// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';

abstract class ShoppingRepo {
  Future<Either<Failure, List<String>>> getBrands();
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getAvaliableProducts();
  Future<Either<Failure, List<ProductModel>>> getSpecificBrandProducts(String brand);
}
