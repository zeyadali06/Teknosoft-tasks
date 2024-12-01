import 'dart:async';
import 'package:e_commerce_app/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app/constants.dart';

Future<Map<String, int>?> getCartItems() async {
  try {
    var res = await DataBase.getField(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid, key: cartField);

    res ??= {};

    if (res is Map) {
      Map<String, int> resultMap = {};

      res.forEach((k, v) {
        String key = k.toString();
        int value = int.parse(v.toString());
        resultMap[key] = value;
      });

      return resultMap;
    }
  } catch (_) {}
  return null;
}

Future<void> addItemToCart(int productID, int numberOfItems) async {
  try {
    var res = await DataBase.getField(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid, key: cartField);
    Map<String, int> resultMap = {productID.toString(): numberOfItems};

    if (res is Map) {
      res.forEach((k, v) {
        String key = k.toString();
        int value = int.parse(v.toString());
        resultMap[key] = value;
      });

      await DataBase.updateField(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {cartField: resultMap});
    }
  } catch (_) {}
}

Future<void> removeItemFromCart(int productID) async {
  try {
    var res = await DataBase.getField(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid, key: cartField);
    Map<String, int> resultMap = {};

    if (res is Map) {
      res.forEach((k, v) {
        String key = k.toString();
        int value = int.parse(v.toString());
        resultMap[key] = value;
      });

      resultMap.remove(productID.toString());
      await DataBase.updateField(collectionPath: cartCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {cartField: resultMap});
    }
  } catch (_) {}
}
