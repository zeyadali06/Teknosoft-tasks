// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle white24Bold(BuildContext context) => TextStyle(color: Colors.white, fontSize: getResponsiveFontSize(context: context, fontSize: 24), fontWeight: FontWeight.bold);
  static TextStyle grey12w500(BuildContext context) => TextStyle(color: Colors.grey, fontSize: getResponsiveFontSize(context: context, fontSize: 12.5), fontWeight: FontWeight.w500);
  static TextStyle black14w500(BuildContext context) => TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 14), fontWeight: FontWeight.bold);
  static TextStyle black18w500(BuildContext context) => TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 18), fontWeight: FontWeight.w500);
  static TextStyle black21w500(BuildContext context) => TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 21), fontWeight: FontWeight.w500);
}
