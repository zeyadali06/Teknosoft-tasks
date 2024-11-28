import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';

abstract class Styles {
  static const TextStyle black32Bold = TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black);

  static const TextStyle blue12Bold = TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 12, color: kPrimaryColor);

  static const TextStyle grey12Bold = TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey);

  static TextStyle white12Bold = TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 12, color: const Color(0xffdcdcdc).withOpacity(.7));

  static const TextStyle blue18Bold = TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 18, color: kPrimaryColor);

  static const TextStyle black20Bold = TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

  static const TextStyle white18w500 = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

  static TextStyle calenderStyle = TextStyle(color: Colors.black.withOpacity(.7));
}
