import 'package:flutter/material.dart';

class Fonts {
  Fonts._();
  static const playfairDisplay = "Playfair Display";
  static const inter = "Inter";
}

TextStyle textStyleForPlayfairDisplay(
    {required double fontSize, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: Fonts.playfairDisplay,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle textStyleForInterW400(
    {required double fontSize, required Color color, double? height}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    fontFamily: Fonts.inter,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle textStyleForInterW500(
    {required double fontSize, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: Fonts.inter,
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle textStyleForInterW600(
    {required double fontSize, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: Fonts.inter,
    fontWeight: FontWeight.w600,
    color: color,
  );
}
