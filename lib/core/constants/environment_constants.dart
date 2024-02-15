import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment constants for the app to use.
mixin EnvironmentConstants {
  /// The API key for the google books API.
  static String get apiKey {
    final key = dotenv.env['API_KEY'];

    if (key == null) {
      throw Exception('API_KEY is not defined in .env');
    }

    return key;
  }
}
