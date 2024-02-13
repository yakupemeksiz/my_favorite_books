import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';

mixin DioClient {
  static final Dio dio = _init();

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: 'example.com/api/',
    headers: {
      HttpHeaders.acceptHeader: 'application/json',
    },
  );

  static Dio _init() {
    final dio = Dio(_baseOptions);
    dio.interceptors.add(
      FancyDioInterceptor(
        options: const FancyDioInspectorOptions(
          consoleOptions: FancyDioInspectorConsoleOptions(
            verbose: true,
          ),
        ),
      ),
    );

    return dio;
  }
}
