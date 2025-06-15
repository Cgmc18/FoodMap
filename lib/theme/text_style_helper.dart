import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline25BoldPoppins => TextStyle(
        fontSize: 25.fSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: appTheme.whiteCustom,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title19BoldPoppins => TextStyle(
        fontSize: 19.fSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: appTheme.blackCustom,
      );

  TextStyle get title16BoldPoppins => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: appTheme.blackCustom,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14Poppins => TextStyle(
        fontSize: 14.fSize,
        fontFamily: 'Poppins',
      );

  TextStyle get body12Poppins => TextStyle(
        fontSize: 12.fSize,
        fontFamily: 'Poppins',
        color: appTheme.colorFF6666,
      );
}
