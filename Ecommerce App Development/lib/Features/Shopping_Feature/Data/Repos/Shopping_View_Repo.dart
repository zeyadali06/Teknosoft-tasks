import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';

abstract class ShoppingRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Either<Failure, List<String>> getCategories(List<ProductModel> allProducts);
  Either<Failure, List<ProductModel>> getAvaliableProducts(List<ProductModel> products);
  Either<Failure, List<ProductModel>> getSpecificCategoryProducts(List<ProductModel> products, String category);
}
