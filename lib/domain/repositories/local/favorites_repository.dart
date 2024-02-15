import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

abstract interface class FavoritesRepository {
  Future<void> addToFavorites({
    required String key,
    required VolumeItemEntity item,
  });
  List<VolumeItemEntity> getFavorites();
  Future<void> removeFavorite(String key);
  Stream<List<VolumeItemEntity>> watchFavorites();
  Future<void> close();
}
