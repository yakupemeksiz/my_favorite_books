import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_favorite_books/core/error/failure.dart';
import 'package:my_favorite_books/data/models/volume_request_model.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';
import 'package:my_favorite_books/data/repositories/volumes_repository_impl.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockVolumesDataSource volumesDataSource;
  late VolumesRepositoryImpl volumesRepositoryImpl;

  const dummyDataPath = 'helpers/dummy_data/dummy_data_volumes.json';
  final dummyDataModel = VolumeResponseModel.fromJson(
    jsonDecode(
      readJson(dummyDataPath),
    ),
  );
  final dummyDataEntity = dummyDataModel.toEntity();

  provideDummy(dummyDataModel);

  setUp(() async {
    volumesDataSource = MockVolumesDataSource();
    volumesRepositoryImpl = VolumesRepositoryImpl(volumesDataSource);
  });

  const request = VolumesRequestModel(query: 'harry potter');

  group('get volumes', () {
    test('should return a volumeResponseEntity', () async {
      when(
        volumesDataSource.getVolumes(
          any,
          request: request,
        ),
      ).thenAnswer(
        (_) async => dummyDataModel,
      );

      final result = await volumesRepositoryImpl.getVolumes(
        CancelToken(),
        request: request,
      );

      expect(
        result,
        equals(Right<Failure, VolumeResponseEntity>(dummyDataEntity)),
      );
    });

    test('should return a failure', () async {
      when(
        volumesDataSource.getVolumes(
          any,
          request: request,
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badCertificate,
        ),
      );

      final result = await volumesRepositoryImpl.getVolumes(
        CancelToken(),
        request: request,
      );

      expect(
        result,
        equals(
          const Left<Failure?, VolumeResponseEntity>(
            ConnectionFailure('Connection failure'),
          ),
        ),
      );
    });

    // should return connection failure when the device has no internet

    test('should return connection failure when the device has no internet',
        () async {
      when(
        volumesDataSource.getVolumes(
          any,
          request: request,
        ),
      ).thenThrow(
        const SocketException('Failed to connect to the network'),
      );

      final result = await volumesRepositoryImpl.getVolumes(
        CancelToken(),
        request: request,
      );

      expect(
        result,
        equals(
          const Left<Failure?, VolumeResponseEntity>(
            ConnectionFailure('Failed to connect to the network'),
          ),
        ),
      );
    });
  });
}
