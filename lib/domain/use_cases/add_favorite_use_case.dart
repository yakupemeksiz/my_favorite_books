import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart';

@injectable
final class AddFavoriteUseCase {
  final FavoritesRepository _favoritesRepository;

  const AddFavoriteUseCase(this._favoritesRepository);

  Future<void> call(String key, VolumeItemEntity item) {
    return _favoritesRepository.addToFavorites(key: key, item: item);
  }
}
