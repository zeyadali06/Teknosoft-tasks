import 'package:e_commerce_app/Core/Utils/Functions/Firebase_Storage_Services.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app/constants.dart';
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
        url = await Storage.storeInFirebaseStorage(file);
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

      await Storage.remFromFirebaseStorage(url);
      url = defaultProfileImageURL;
      AuthRepoImplementation.allUserData!.profileURL = defaultProfileImageURL;
      await DataBase.updateField(collectionPath: usersCollection, docName: AuthRepoImplementation.allUserData!.uid, data: {'profileURL': url});

      emit(ProfileImageFinished());
    } catch (_) {
      emit(ProfileImageFinished());
    }
    return url;
  }
}
