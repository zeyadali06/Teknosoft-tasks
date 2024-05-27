import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Cart.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Cart_Feature/Data/Models/Cart_Item_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Repos/Shopping_View_Repo_Implement.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'cart_view_state.dart';

class CartViewCubit extends Cubit<CartViewState> {
  CartViewCubit(this.repo) : super(CartViewInitial());

  ShoppingRepoImplement repo;
  late List<CartItem> cartItems;
  late double subtotalPrice = 0;
  late double deliveryFeePrice = 10.00;
  late double discountPercentage = 0;
  late double totalPrice = 0;

  Future<List<CartItem>> getItemsInCart() async {
    subtotalPrice = 0;
    deliveryFeePrice = 10.00;
    discountPercentage = 0;
    totalPrice = 0;

    List<CartItem> finalRes = [];
    try {
      emit(CartViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(CartViewFailed("No Internet Connection"));
        return [];
      }

      Map<String, int>? items = await getCartItems();
      var res = await repo.getAllProducts();

      items ??= {};

      res.fold((l) {
        throw l;
      }, (r) {
        for (ProductModel prod in r) {
          if (items!.containsKey(prod.id.toString())) {
            CartItem item = CartItem(id: prod.id, product: prod, numberOfItems: items[prod.id.toString()]!);
            finalRes.add(item);
            subtotalPrice += (item.product.price * item.numberOfItems);
            totalPrice += (item.product.price - (item.product.price * item.product.discountPercentage / 100)) * item.numberOfItems;
          }
        }
      });

      if (subtotalPrice == 0) {
        discountPercentage = 0;
      } else {
        discountPercentage = ((subtotalPrice - totalPrice) / subtotalPrice) * 100;
      }
      totalPrice += deliveryFeePrice;

      cartItems = finalRes;
      if (finalRes.isEmpty) {
        emit(CartViewEmpty());
      } else {
        emit(CartViewSuccessed());
      }
    } catch (e) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(CartViewFailed("No Internet Connection"));
        } else {
          emit(CartViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
    return finalRes;
  }

  Future<void> deleteFromCart(ProductModel product) async {
    try {
      emit(CartViewLoading());

      bool connStat = await checkConn();
      if (!connStat) {
        emit(CartViewFailed("No Internet Connection"));
        return;
      }

      await removeItemFromCart(product.id);

      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].id == product.id) {
          subtotalPrice -= cartItems[i].product.price * cartItems[i].numberOfItems;
          totalPrice -= deliveryFeePrice;
          totalPrice -= (cartItems[i].product.price - (cartItems[i].product.price * cartItems[i].product.discountPercentage / 100)) * cartItems[i].numberOfItems;
          cartItems.removeAt(i);
          if (subtotalPrice == 0) {
            discountPercentage = 0;
          } else {
            discountPercentage = ((subtotalPrice - totalPrice) / subtotalPrice) * 100;
          }
          totalPrice += deliveryFeePrice;

          break;
        }
      }

      if (cartItems.isEmpty) {
        emit(CartViewEmpty());
      } else {
        emit(CartViewSuccessed());
      }
    } catch (e) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(CartViewFailed("No Internet Connection"));
        } else {
          emit(CartViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
  }

  Future<void> checkOut() async {
    try {
      emit(CartViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(CartViewFailed("No Internet Connection"));
        return;
      }
      await DataBase.setField(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {cartField: {}});
      cartItems.clear();
      subtotalPrice = 0;
      deliveryFeePrice = 10.00;
      discountPercentage = 0;
      totalPrice = 0;
      emit(CartViewEmpty());
    } catch (e) {
      try {
        bool connStat = await checkConn();
        if (!connStat) {
          emit(CartViewFailed("No Internet Connection"));
        } else {
          emit(CartViewFailed(AuthFailure(e).errMessage));
        }
      } catch (_) {}
    }
  }
}
