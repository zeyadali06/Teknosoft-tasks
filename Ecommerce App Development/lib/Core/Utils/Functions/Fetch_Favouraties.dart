// ignore_for_file: file_names

import 'dart:async';

import 'package:e_commerce_app_development/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/constants.dart';

Future<List<int>?> getFavouraties() async {
  // return list contain ids of the products
  try {
    var res = await DataBase.getField(collectionPath: favourateCollection, docName: AuthRepoImplementation.allUserData!.uid, key: favouratesField);

    res ??= [];

    if (res != null && res is List) {
      try {
        return List<int>.from(res.map((item) => int.parse(item.toString())));
      } catch (_) {}
    }
    return null;
  } catch (_) {}
  return null;
}

Future<void> editFavouraties(int productID, bool status) async {
  try {
    List<int>? ids = await getFavouraties();

    if (ids == null) {
      ids = [productID];
    } else {
      if (status) {
        ids.add(productID);
      } else {
        ids.remove(productID);
      }
    }

    await DataBase.updateField(collectionPath: favourateCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {favouratesField: ids});
  } catch (_) {}
}
