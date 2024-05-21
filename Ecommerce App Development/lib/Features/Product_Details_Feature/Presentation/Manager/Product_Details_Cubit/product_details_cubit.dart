import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Core/Utils/FirebaseFirestoreServices.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_List.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Fetch_Map.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:e_commerce_app_development/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  Future<void> changeFavourateStatus(ProductModel product, bool status) async {
    try {
      emit(ProductDetailsLoading());
      var res = await DataBase.getField(collectionPath: favourateCollection, docName: allUserData!.uid, key: favouratesField);

      List<int> favourates = convertToList(res)!;
      if (status) {
        favourates.add(product.id);
      } else {
        favourates.remove(product.id);
      }
      await DataBase.updateField(collectionPath: favourateCollection, docName: allUserData!.uid, data: {favouratesField: favourates});

      emit(ProductDetailsFavourateSuccessed());
    } catch (e) {
      try {
        emit(ProductDetailsFailed(errMessage: AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }

  Future<void> addToCart(ProductModel product, int numberOfItems) async {
    try {
      emit(ProductDetailsLoading());
      if (numberOfItems == 0) {
        emit(ProductDetailsCartNOItemsEqualZero());
        return;
      }
      
      var res = await DataBase.getField(collectionPath: cartCollection, docName: allUserData!.uid, key: cartField);
      Map<String, int> data = convertToMap(res)!;

      if (data.containsKey(product.id.toString())) {
        data.update(product.id.toString(), (value) {
          return numberOfItems;
        });
      } else {
        data[product.id.toString()] = numberOfItems;
      }

      await DataBase.updateField(collectionPath: cartCollection, docName: allUserData!.uid, data: {cartField: data});

      emit(ProductDetailsCartSuccessed());
    } catch (e) {
      try {
        emit(ProductDetailsFailed(errMessage: AuthFailure(e).errMessage));
      } catch (_) {}
    }
  }
}
