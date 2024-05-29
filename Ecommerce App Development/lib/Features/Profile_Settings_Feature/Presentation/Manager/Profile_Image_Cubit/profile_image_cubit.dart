import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Get_File_Path.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  ProfileImageCubit() : super(ProfileImageInitial());

  String url = AuthRepoImplementation.allUserData!.profileURL;

  Future<String> pickImage() async {
    try {
      emit(ProfileImageLoading());
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);

      if (imagePicked != null) {
        File file = File(imagePicked.path);
        url = await storeInFirebaseStorage(file);
        AuthRepoImplementation.allUserData!.profileURL = url;
        await DataBase.updateField(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {'profileURL': url});
      }

      emit(ProfileImageFinished());
    } catch (_) {
      emit(ProfileImageFinished());
    }
    return url;
  }

  Future<String> deleteImage() async {
    try {
      emit(ProfileImageLoading());

      await remFromFirebaseStorage(url);
      url = defaultProfileImageURL;
      AuthRepoImplementation.allUserData!.profileURL = defaultProfileImageURL;
      await DataBase.updateField(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {'profileURL': url});

      emit(ProfileImageFinished());
    } catch (_) {
      emit(ProfileImageFinished());
    }
    return url;
  }

  Future<String> storeInFirebaseStorage(File file) async {
    final Reference ref = FirebaseStorage.instance.ref(getFilePath(file));
    await ref.putFile(file);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> remFromFirebaseStorage(String url) async {
    await FirebaseStorage.instance.refFromURL(url).delete();
    await DataBase.updateField(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {'profileURL': defaultProfileImageURL});
  }
}
