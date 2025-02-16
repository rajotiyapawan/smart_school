import 'package:flutter/material.dart';

TextStyle baseTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle semibold({required double fontSize, Color? color}) {
  return baseTextStyle(fontSize, color ?? Colors.black, FontWeight.w600);
}

TextStyle bold({required double fontSize, Color? color}) {
  return baseTextStyle(fontSize, color ?? Colors.black, FontWeight.bold);
}

TextStyle medium({required double fontSize, Color? color}) {
  return baseTextStyle(fontSize, color ?? Colors.black, FontWeight.w500);
}

TextStyle normal({required double fontSize, Color? color}) {
  return baseTextStyle(fontSize, color ?? Colors.black, FontWeight.normal);
}