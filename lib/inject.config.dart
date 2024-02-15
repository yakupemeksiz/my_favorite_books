// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_favorite_books/data/data_sources/local/favorites_data_source.dart'
    as _i3;
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart'
    as _i9;
import 'package:my_favorite_books/data/repositories/local/favorites_repository_impl.dart'
    as _i5;
import 'package:my_favorite_books/data/repositories/remote/volumes_repository_impl.dart'
    as _i11;
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart'
    as _i4;
import 'package:my_favorite_books/domain/repositories/remote/volumes_repository.dart'
    as _i10;
import 'package:my_favorite_books/domain/use_cases/add_favorite_use_case.dart'
    as _i12;
import 'package:my_favorite_books/domain/use_cases/close_favorite_use_case.dart'
    as _i13;
import 'package:my_favorite_books/domain/use_cases/get_favorites_use_case.dart'
    as _i6;
import 'package:my_favorite_books/domain/use_cases/get_volumes_use_case.dart'
    as _i15;
import 'package:my_favorite_books/domain/use_cases/remove_favorites_use_case.dart'
    as _i7;
import 'package:my_favorite_books/domain/use_cases/stream_favorites_use_case.dart'
    as _i8;
import 'package:my_favorite_books/inject.dart' as _i17;
import 'package:my_favorite_books/presentation/views/favorites/cubit/favorites_cubit.dart'
    as _i14;
import 'package:my_favorite_books/presentation/views/search/cubit/search_cubit.dart'
    as _i16;

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
    gh.singleton<_i3.FavoritesDataSource>(_i3.FavoritesDataSource());
    gh.factory<_i4.FavoritesRepository>(
        () => _i5.FavoritesRepositoryImpl(gh<_i3.FavoritesDataSource>()));
    gh.factory<_i6.GetFavoritesUseCase>(
        () => _i6.GetFavoritesUseCase(gh<_i4.FavoritesRepository>()));
    gh.factory<_i7.RemoveFavoriteUseCase>(
        () => _i7.RemoveFavoriteUseCase(gh<_i4.FavoritesRepository>()));
    gh.factory<_i8.StreamFavoritesUseCase>(
        () => _i8.StreamFavoritesUseCase(gh<_i4.FavoritesRepository>()));
    gh.factory<_i9.VolumesDataSource>(() => registerModule.volumesDataSource);
    gh.factory<_i10.VolumesRepository>(
        () => _i11.VolumesRepositoryImpl(gh<_i9.VolumesDataSource>()));
    gh.factory<_i12.AddFavoriteUseCase>(
        () => _i12.AddFavoriteUseCase(gh<_i4.FavoritesRepository>()));
    gh.factory<_i13.CloseFavoriteUseCase>(
        () => _i13.CloseFavoriteUseCase(gh<_i4.FavoritesRepository>()));
    gh.factory<_i14.FavoritesCubit>(() => _i14.FavoritesCubit(
          gh<_i6.GetFavoritesUseCase>(),
          gh<_i7.RemoveFavoriteUseCase>(),
          gh<_i8.StreamFavoritesUseCase>(),
        ));
    gh.factory<_i15.GetVolumesUseCase>(
        () => _i15.GetVolumesUseCase(gh<_i10.VolumesRepository>()));
    gh.factory<_i16.SearchCubit>(() => _i16.SearchCubit(
          gh<_i15.GetVolumesUseCase>(),
          gh<_i6.GetFavoritesUseCase>(),
          gh<_i12.AddFavoriteUseCase>(),
          gh<_i7.RemoveFavoriteUseCase>(),
          gh<_i8.StreamFavoritesUseCase>(),
          gh<_i13.CloseFavoriteUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
