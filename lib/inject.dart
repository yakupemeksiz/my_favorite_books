import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/core/api/dio_client.dart';
import 'package:my_favorite_books/core/config/flavor_config.dart';
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart';
import 'package:my_favorite_books/inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init(environment: FlavorConfig.currentFlavor);
}

@module
abstract class RegisterModule {
  final VolumesDataSource volumesDataSource = VolumesDataSource(DioClient.dio);
}
