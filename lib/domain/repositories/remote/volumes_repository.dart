import 'package:dio/dio.dart';
import 'package:my_favorite_books/core/config/types.dart';
import 'package:my_favorite_books/domain/entities/volume_request_entity.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

/// This class is a repository for volumes in the remote data source
abstract interface class VolumesRepository {
  RemoteFetchResult<VolumeResponseEntity> getVolumes(
    CancelToken token, {
    required VolumesRequestEntity request,
  });
}
