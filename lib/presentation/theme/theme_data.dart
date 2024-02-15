import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_favorite_books/core/constants/color_constants.dart';

class AppThemeData {
  static final ThemeData appTheme = ThemeData.dark(
    useMaterial3: false,
  ).copyWith(
    scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColor,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorConstants.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 30.sp,
      ),
    ),
  );
}
