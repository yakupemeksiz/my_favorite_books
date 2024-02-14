import 'package:dio/dio.dart';
import 'package:my_favorite_books/data/models/volume_request_model.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'volumes_data_source.g.dart';

@RestApi()
abstract class VolumesDataSource {
  factory VolumesDataSource(Dio dio, {String baseUrl}) = _VolumesDataSource;

  static const String _endpoint = '/volumes';

  @GET(_endpoint)
  Future<VolumeResponseModel> getVolumes(
    @CancelRequest() CancelToken cancelToken, {
    @Queries() required VolumesRequestModel request,
  });
}
