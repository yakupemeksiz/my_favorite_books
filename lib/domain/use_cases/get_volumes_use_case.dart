import 'package:dio/dio.dart';
import 'package:my_favorite_books/core/config/types.dart';
import 'package:my_favorite_books/domain/entities/volume_request_entity.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/remote/volumes_repository.dart';

final class GetVolumesUseCase {
  final VolumesRepository _volumesRepository;

  const GetVolumesUseCase(this._volumesRepository);

  Future<RemoteFetchResult<VolumeResponseEntity>> call({
    required VolumesRequestEntity request,
    required CancelToken cancelToken,
  }) async {
    return _volumesRepository.getVolumes(
      cancelToken,
      request: request,
    );
  }
}
