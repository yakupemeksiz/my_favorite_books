import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class LocalizationConfig {
  LocalizationConfig._();

  static List<Locale> get _supportedLocales => const [
        Locale('en', 'US'),
      ];

  static String get _path => 'assets/translations';

  static Widget runAppWithEasyWidget(Widget myApp) {
    return EasyLocalization(
      supportedLocales: _supportedLocales,
      path: _path,
      child: myApp,
    );
  }
}
