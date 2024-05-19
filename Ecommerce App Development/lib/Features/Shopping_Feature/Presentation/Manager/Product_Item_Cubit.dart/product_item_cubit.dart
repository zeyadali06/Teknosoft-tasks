import 'package:e_commerce_app_development/Core/Utils/FirebaseFirestoreServices.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_List.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:e_commerce_app_development/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_item_state.dart';

class ProductItemCubit extends Cubit<ProductItemState> {
  ProductItemCubit() : super(ProductItemInitial());

  Future<void> changeFavourateStatus(ProductModel product, bool status) async {
    var ret = await DataBase.getField(collectionPath: favourateCollection, docName: allUserData!.uid, key: favouratesField);
    List<int> favourates = toListOfInt(ret)!;
    if (status) {
      favourates.add(product.id);
    } else {
      favourates.remove(product.id);
    }

    await DataBase.setField(collectionPath: favourateCollection, docName: allUserData!.uid, data: {favouratesField: favourates.toSet().toList()});
  }

  Future<bool> getFavourateStatus(ProductModel product) async {
    var ret = await DataBase.getField(collectionPath: favourateCollection, docName: allUserData!.uid, key: favouratesField);
    List<int> favourates = toListOfInt(ret)!;

    if (favourates.contains(product.id)) {
      return true;
    } else {
      return false;
    }
  }
}
