import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

void showProgress(BuildContext context, bool isLoading) {
  if (isLoading) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: Stack(
            children: <Widget>[
              ModalBarrier(
                color: Colors.black12,
                dismissible: false,
              ),
              Center(child: CircularProgressIndicator(color: kPrimaryColor)),
            ],
          ),
        );
      },
    );
  } else {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

Future<void> waitUntilFinished(BuildContext context, final Future<void> Function() func) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const PopScope(
        canPop: false,
        child: Stack(
          children: <Widget>[
            ModalBarrier(
              color: Colors.black12,
              dismissible: false,
            ),
            Center(child: CircularProgressIndicator(color: kPrimaryColor)),
          ],
        ),
      );
    },
  );
  await func();
  if (context.mounted) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
