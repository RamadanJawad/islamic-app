import 'package:flutter/material.dart';
import 'manager_fonts.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
  TextDecoration decoration,
  dynamic overflow,
) {
  return TextStyle(
    
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    
    decoration: decoration,
    overflow: overflow,
  );
}

// Regular TextStyle
TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  dynamic overflow = TextOverflow.visible,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    ManagerFontFamily.fontFamily,
    ManagerFontWeight.regular,
    color,
    decoration,
    overflow,
  );
}

// Medium TextStyle
TextStyle getLightTextStyle({
  required double fontSize,
  required Color color,
  TextAlign align = TextAlign.justify,
  TextDecoration decoration = TextDecoration.none,
  dynamic overflow = TextOverflow.visible,
}) {
  return _getTextStyle(fontSize, ManagerFontFamily.fontFamily,
      ManagerFontWeight.light, color, decoration, overflow);
}

// Bold TextStyle
TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  dynamic overflow = TextOverflow.visible,
}) {
  return _getTextStyle(fontSize, ManagerFontFamily.fontFamily,
      ManagerFontWeight.bold, color, decoration, overflow);
}
