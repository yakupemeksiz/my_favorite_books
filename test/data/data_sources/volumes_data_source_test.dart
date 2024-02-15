import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';

import '../../helpers/test_helper.dart';

void main() {
  late VolumesDataSource volumesDataSource;
  late MockWebServer mockWebServer;
  final headers = {'Content-Type': 'application/json'};

  setUp(() async {
    mockWebServer = MockWebServer();
    await mockWebServer.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    volumesDataSource = VolumesDataSource(dio, baseUrl: mockWebServer.url);
  });

  tearDown(() {
    mockWebServer.shutdown();
  });

  group('VolumesDataSource', () {
    test('should return VolumesRequestModel when the response code is 200',
        () async {
      mockWebServer.enqueue(
        body: jsonVolumesData,
        headers: headers,
      );

      final result = await volumesDataSource.getVolumes(
        CancelToken(),
        request: volumesRequestModel,
      );

      expect(result, isA<VolumeResponseModel>());
    });

    test('should throw an exception when the response code is not 200',
        () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
      );

      expect(
        () => volumesDataSource.getVolumes(
          CancelToken(),
          request: volumesRequestModel,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
