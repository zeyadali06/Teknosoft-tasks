import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';

class CartItem {
  final int id;
  final ProductModel product;
  final int numberOfItems;

  CartItem({required this.id, required this.product, required this.numberOfItems});
}
