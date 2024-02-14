// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart'
    as _i3;
import 'package:my_favorite_books/data/repositories/volumes_repository_impl.dart'
    as _i5;
import 'package:my_favorite_books/domain/repositories/remote/volumes_repository.dart'
    as _i4;
import 'package:my_favorite_books/inject.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.VolumesDataSource>(() => registerModule.volumesDataSource);
    gh.factory<_i4.VolumesRepository>(
        () => _i5.VolumesRepositoryImpl(gh<_i3.VolumesDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}
