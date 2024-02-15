import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_favorite_books/core/error/failure.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/use_cases/get_volumes_use_case.dart';

import '../../helpers/test_helper.dart';
import '../../helpers/test_helper.mocks.dart';

Future<void> main() async {
  late final MockVolumesRepository volumesRepository;
  late final GetVolumesUseCase getVolumesUseCase;

  late final CancelToken cancelToken;

  provideDummy<Either<Failure?, VolumeResponseEntity>>(
    Right(dummyVolumeResponseEntity),
  );

  setUp(() {
    volumesRepository = MockVolumesRepository();
    getVolumesUseCase = GetVolumesUseCase(volumesRepository);
    cancelToken = CancelToken();
  });

  test('should call getVolumes from VolumesRepository', () async {
    when(
      getVolumesUseCase.call(
        request: volumesRequestModel,
        cancelToken: cancelToken,
      ),
    ).thenAnswer((realInvocation) async => Right(dummyVolumeResponseEntity));

    final result = await getVolumesUseCase.call(
      request: volumesRequestModel,
      cancelToken: cancelToken,
    );

    expect(
      result,
      Right<Failure, VolumeResponseEntity>(dummyVolumeResponseEntity),
    );
  });
}
