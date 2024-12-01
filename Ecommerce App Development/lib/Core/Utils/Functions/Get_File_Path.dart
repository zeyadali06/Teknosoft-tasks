import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

String getFilePath(File file) {
  String fileName = path.basename(file.path);
  return "$profileImagesFolderPath/${AuthRepoImplementation.allUserData!.uid}/$fileName";
}
