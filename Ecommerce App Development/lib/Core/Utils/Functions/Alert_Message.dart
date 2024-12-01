// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:flutter/material.dart';

Future<T?> showAlertMesssge<T>(BuildContext context, String title, String content) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(title),
          content: Text(content, style: Styles.black18w500(context).copyWith(fontWeight: FontWeight.normal)),
          actions: <Widget>[
            CustomButton(
              width: 50,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
              buttonText: 'OK',
            ),
          ],
        ),
      );
    },
  );
}
