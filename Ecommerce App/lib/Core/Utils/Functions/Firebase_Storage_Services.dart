import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Get_File_Path.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class Storage {
  static Future<void> remFromFirebaseStorage(String url) async {
    await FirebaseStorage.instance.refFromURL(url).delete();
    await DataBase.updateField(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {'profileURL': defaultProfileImageURL});
  }

  static Future<String> storeInFirebaseStorage(File file) async {
    final Reference ref = FirebaseStorage.instance.ref(getFilePath(file));
    await ref.putFile(file);
    String url = await ref.getDownloadURL();
    return url;
  }
}
