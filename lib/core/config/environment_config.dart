import 'dart:developer';

import 'package:my_favorite_books/core/constants/environment_constants.dart';

class EnvironmentConfig {
  EnvironmentConfig() {
    if (!_environments.contains(_currentEnvironment)) {
      final errorMessage =
          'Unknown environment! (${Environments.envKey}: $_currentEnvironment)';

      log(errorMessage);
      throw Exception(errorMessage);
    }

    log('Current environment: $_currentEnvironment');
  }
  final List<String> _environments = [
    Environments.dev,
    Environments.stage,
    Environments.prod,
  ];

  static String get _currentEnvironment =>
      const String.fromEnvironment(Environments.envKey);
  static String get currentEnvironment => _currentEnvironment;

  static bool get isProd => _currentEnvironment == Environments.prod;
  static bool get isDev => _currentEnvironment == Environments.dev;
  static bool get isStage => _currentEnvironment == Environments.stage;
}
