// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/RegisterDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';

abstract class AuthRepo {
  static UserData? allUserData;
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> login(LoginData loginData);
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> signUp(SignUpData userdata);
}

class AuthCompletedSuccessfully {
  UserData userData;

  AuthCompletedSuccessfully(this.userData);
}
