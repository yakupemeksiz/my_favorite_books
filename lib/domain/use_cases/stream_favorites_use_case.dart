import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart';

@injectable
final class StreamFavoritesUseCase {
  final FavoritesRepository _favoritesRepository;

  const StreamFavoritesUseCase(this._favoritesRepository);

  Stream<List<VolumeItemEntity>> call() {
    return _favoritesRepository.watchFavorites();
  }
}
