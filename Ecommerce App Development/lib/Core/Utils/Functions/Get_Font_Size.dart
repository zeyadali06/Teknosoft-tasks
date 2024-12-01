import 'package:flutter/material.dart';

double getResponsiveFontSize({required BuildContext context, required double fontSize}) {
  double scaleFactor = _getScaleFactor(context: context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .95;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double _getScaleFactor({required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
