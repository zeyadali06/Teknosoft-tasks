import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/SignUpDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/LoginDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Models/User_Data_Model/UserDataModel.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo.dart';
import 'package:e_commerce_app_development/Core/Utils/Firebase_Firestore_Services.dart';
import 'package:e_commerce_app_development/Core/Utils/Auth_Services.dart';
import 'package:e_commerce_app_development/Core/Error/Fauiler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImplementation implements AuthRepo {
  static UserData? allUserData;

  @override
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> login(LoginData loginData) async {
    try {
      String? email, uid;
      if (loginData.usingUserName) {
        uid = await AccountData.getUIDFromFirestoreUsingUsername(loginData.username!);
        if (uid == null || uid.isEmpty) {
          return left(AuthFailure(FirebaseAuthException(code: "username-not-found")));
        }
        email = await AccountData.getEmailFromFirestore(uid);
      } else if (loginData.usingemail) {
        uid = await AccountData.getUIDFromFirestoreUsingEmail(loginData.email!);
        if (uid == null || uid.isEmpty) {
          return left(AuthFailure(FirebaseAuthException(code: "user-not-found")));
        }
        email = loginData.email;
      }
      Map<String, dynamic>? data = await AccountData.getUserDataFromFirestore(uid!);
      UserCredential user = await SignIn.signIn(email!, loginData.password!);
      allUserData = UserData(email: email, username: data!['username'], phone: data['phone'], uid: user.user!.uid, profileURL: data['profileURL']);
      return right(AuthCompletedSuccessfully(allUserData!));
    } catch (e) {
      return left(AuthFailure(e));
    }
  }

  @override
  Future<Either<AuthFailure, AuthCompletedSuccessfully>> signUp(SignUpData registerData) async {
    try {
      if (await AccountData.getUIDFromFirestoreUsingUsername(registerData.username) != null) {
        return left(AuthFailure(FirebaseAuthException(code: "username-already-in-use")));
      }

      Map<String, dynamic> data = registerData.toMap();
      data.remove('password');
      data['profileURL'] = defaultProfileImageURL;

      UserCredential user = await Register.register(data, registerData.password);
      allUserData = UserData(email: registerData.email, username: registerData.username, phone: registerData.phone, uid: user.user!.uid, profileURL: defaultProfileImageURL);

      await DataBase.setField(collectionPath: favourateCollection, docName: allUserData!.uid, data: {favouratesField: []});
      await DataBase.setField(collectionPath: cartCollection, docName: allUserData!.uid, data: {cartField: {}});
      await DataBase.setField(collectionPath: addressesCollection, docName: allUserData!.uid, data: {addressesField: []});

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool(loginStatusPrefKey, false);

      return right(AuthCompletedSuccessfully(allUserData!));
    } catch (e) {
      return left(AuthFailure(e));
    }
  }
}
