import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_favorite_books/core/error/failure.dart';
import 'package:my_favorite_books/data/repositories/remote/volumes_repository_impl.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

import '../../helpers/test_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockVolumesDataSource volumesDataSource;
  late VolumesRepositoryImpl volumesRepositoryImpl;

  provideDummy(dummyVolumeResponseModel);

  setUp(() async {
    volumesDataSource = MockVolumesDataSource();
    volumesRepositoryImpl = VolumesRepositoryImpl(volumesDataSource);
  });

  group('get volumes', () {
    test('should return a volumeResponseEntity', () async {
      when(
        volumesDataSource.getVolumes(
          any,
          request: volumesRequestModel,
        ),
      ).thenAnswer(
        (_) async => dummyVolumeResponseModel,
      );

      final result = await volumesRepositoryImpl.getVolumes(
        CancelToken(),
        request: volumesRequestModel,
      );

      expect(
        result,
        equals(Right<Failure, VolumeResponseEntity>(dummyVolumeResponseEntity)),
      );
    });

    test('should return a failure', () async {
      when(
        volumesDataSource.getVolumes(
          any,
          request: volumesRequestModel,
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badCertificate,
        ),
      );

      final result = await volumesRepositoryImpl.getVolumes(
        CancelToken(),
        request: volumesRequestModel,
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

    test('should return connection failure when the device has no internet',
        () async {
      when(
        volumesDataSource.getVolumes(
          any,
          request: volumesRequestModel,
        ),
      ).thenThrow(
        const SocketException('Failed to connect to the network'),
      );

      final result = await volumesRepositoryImpl.getVolumes(
        CancelToken(),
        request: volumesRequestModel,
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
