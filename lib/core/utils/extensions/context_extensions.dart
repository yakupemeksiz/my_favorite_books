import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  double get defaultPadding => 16;
  double get bottomPadding => MediaQuery.paddingOf(this).bottom;
  double get topPadding => MediaQuery.paddingOf(this).top;
  double get bottomOrDefaultPadding =>
      bottomPadding > 0 ? bottomPadding : defaultPadding;

  // textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Show a flash bar at the top of the screen
  Future<void> showTopError({
    required String title,
  }) async {
    return showErrorBar(
      position: FlashPosition.top,
      content: Text(title),
    );
  }
}
