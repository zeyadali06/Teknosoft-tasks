import 'package:flutter/material.dart';

double getResponsiveFontSize({required BuildContext context, required double fontSize}) {
  double scaleFactor = getScaleFactor(context: context);
  double responsiveFontSize = fontSize * scaleFactor;
  return responsiveFontSize;
}

double getScaleFactor({required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  return width / 350;
}
