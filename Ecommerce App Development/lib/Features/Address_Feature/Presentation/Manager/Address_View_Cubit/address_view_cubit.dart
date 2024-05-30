import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/Features/Address_Feature/Data/Models/Address_Model_Data.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/From_Json_To_Map_Address.dart';
import 'package:e_commerce_app_development/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Check_Network.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'address_view_state.dart';

class AddressViewCubit extends Cubit<AddressViewState> {
  AddressViewCubit() : super(AddressViewInitial());

  List<Address> allAddresses = [];

  Future<void> addAddress(Address address) async {
    try {
      emit(AddressViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
        return;
      }

      bool isExist = false;
      for (var element in allAddresses) {
        if (Address.compareAddresses(address, element)) {
          isExist = true;
          break;
        }
      }

      if (isExist) {
        return;
      } else {
        allAddresses.add(address);
        List<Map<String, dynamic>> res = [];
        for (var element in allAddresses) {
          res.add(element.toMap());
        }
        await DataBase.updateField(
          collectionPath: addressesCollection,
          docName: AuthRepoImplementation.allUserData!.uid,
          data: {addressesField: res},
        );
      }

      emit(AddressViewSuccessed());
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
      } else {
        emit(AddressViewFailed(AuthFailure(e).errMessage));
      }
    }
  }

  Future<void> removeAddress(Address address) async {
    try {
      emit(AddressViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
        return;
      }

      for (int i = 0; i < allAddresses.length; i++) {
        if (Address.compareAddresses(address, allAddresses[i])) {
          allAddresses.removeAt(i);
          List<Map<String, dynamic>> res = [];
          for (Address element in allAddresses) {
            res.add(element.toMap());
          }
          await DataBase.updateField(
            collectionPath: addressesCollection,
            docName: AuthRepoImplementation.allUserData!.uid,
            data: {addressesField: res},
          );
          break;
        }
      }

      emit(AddressViewSuccessed());
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
      } else {
        emit(AddressViewFailed(AuthFailure(e).errMessage));
      }
    }
  }

  Future<List<Address>> getAddresses() async {
    try {
      emit(AddressViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
        return [];
      }

      var data = await DataBase.getField(
        collectionPath: addressesCollection,
        docName: AuthRepoImplementation.allUserData!.uid,
        key: addressesField,
      );

      allAddresses.clear();

      for (Map<String, dynamic> element in dynamicToAddress(data)) {
        allAddresses.add(Address.fromMap(element));
      }

      emit(AddressViewSuccessed());
      return allAddresses;
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
      } else {
        emit(AddressViewFailed(AuthFailure(e).errMessage));
      }
    }
    return [];
  }

  Future<void> makeDefault(Address address) async {
    try {
      if (allAddresses.length == 1) {
        return;
      }

      emit(AddressViewLoading());
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
        return;
      }

      for (int i = 0; i < allAddresses.length; i++) {
        if (Address.compareAddresses(address, allAddresses[i])) {
          allAddresses.insert(0, allAddresses.removeAt(i));
          List<Map<String, dynamic>> res = [];
          for (Address element in allAddresses) {
            res.add(element.toMap());
          }
          await DataBase.updateField(
            collectionPath: addressesCollection,
            docName: AuthRepoImplementation.allUserData!.uid,
            data: {addressesField: res},
          );
          break;
        }
      }

      emit(AddressViewSuccessed());
    } catch (e) {
      bool connStat = await checkConn();
      if (!connStat) {
        emit(AddressViewFailed("No Internet Connection"));
      } else {
        emit(AddressViewFailed(AuthFailure(e).errMessage));
      }
    }
  }
}
