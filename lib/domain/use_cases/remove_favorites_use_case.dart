import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart';

@injectable
final class RemoveFavoriteUseCase {
  final FavoritesRepository _favoritesRepository;

  const RemoveFavoriteUseCase(this._favoritesRepository);

  Future<void> call(String key) {
    return _favoritesRepository.removeFavorite(key);
  }
}
