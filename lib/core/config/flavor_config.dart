import 'dart:developer';

import 'package:my_favorite_books/core/constants/flavor_constants.dart';

/// This class is a configuration for the flavor of the app (dev, stage, prod)
final class FlavorConfig {
  FlavorConfig() {
    if (!_flavors.contains(_currentFlavor)) {
      final errorMessage =
          'Unknown flavor! (${FlavorConstants.envKey}: $_currentFlavor)';

      log(errorMessage);
      throw Exception(errorMessage);
    }

    log('Current flavor: $_currentFlavor');
  }
  final List<String> _flavors = [
    FlavorConstants.dev,
    FlavorConstants.stage,
    FlavorConstants.prod,
  ];

  static String get _currentFlavor =>
      const String.fromEnvironment(FlavorConstants.envKey);
  static String get currentFlavor => _currentFlavor;

  static bool get isProd => _currentFlavor == FlavorConstants.prod;
  static bool get isDev => _currentFlavor == FlavorConstants.dev;
  static bool get isStage => _currentFlavor == FlavorConstants.stage;
}
