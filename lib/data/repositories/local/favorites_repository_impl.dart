import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/data/data_sources/local/favorites_data_source.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart';

@Injectable(as: FavoritesRepository)
final class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDataSource _favoritesDataSource;

  const FavoritesRepositoryImpl(this._favoritesDataSource);

  @override
  Stream<List<VolumeItemEntity>> watchFavorites() async* {
    final events = _favoritesDataSource.watch();

    if (events == null) {
      yield [];
      return;
    }

    await for (final _ in events) {
      yield _favoritesDataSource.readAll().map((e) => e.toEntity()).toList();
    }
  }

  @override
  Future<void> addToFavorites({
    required String key,
    required VolumeItemEntity item,
  }) {
    return _favoritesDataSource.save(key, item.toModel());
  }

  @override
  Future<void> removeFavorite(String key) {
    return _favoritesDataSource.delete(key);
  }

  @override
  List<VolumeItemEntity> getFavorites() {
    return _favoritesDataSource.readAll().map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> close() {
    return _favoritesDataSource.close();
  }
}
