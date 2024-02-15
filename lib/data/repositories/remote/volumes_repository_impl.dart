import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/core/config/types.dart';
import 'package:my_favorite_books/core/utils/mixins/network_handler_mixin.dart';
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart';
import 'package:my_favorite_books/domain/entities/volume_request_entity.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/remote/volumes_repository.dart';

/// Volumes repository implementation class
@Injectable(as: VolumesRepository)
class VolumesRepositoryImpl
    with NetworkHandlerMixin
    implements VolumesRepository {
  final VolumesDataSource _volumesDataSource;

  VolumesRepositoryImpl(this._volumesDataSource);

  /// Get volumes from the API
  @override
  RemoteFetchResult<VolumeResponseEntity> getVolumes(
    CancelToken token, {
    required VolumesRequestEntity request,
  }) async {
    return networkHandler(
      () async {
        final res = await _volumesDataSource.getVolumes(
          token,
          request: request.toModel(),
        );
        return res.toEntity();
      },
    );
  }
}
