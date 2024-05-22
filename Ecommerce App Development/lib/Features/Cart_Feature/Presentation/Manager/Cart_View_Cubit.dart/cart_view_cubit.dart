import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_view_state.dart';

class CartViewCubit extends Cubit<CartViewState> {
  CartViewCubit(this.repo) : super(CartViewInitial());

  ShoppingRepoImplement repo;

  Future<void> getProductsInCart() async {}

  Future<void> checkOut() async {}
}
