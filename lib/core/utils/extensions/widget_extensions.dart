import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtension on Widget {
  /// Adds horizontal padding of 16 to the widget
  ///
  /// ```dart
  /// Text('Hello World').symmetricHDefaultPadding
  /// ```
  Widget get symmetricHDefaultPadding => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: this,
      );
}
