import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart';

@injectable
final class CloseFavoriteUseCase {
  final FavoritesRepository _favoritesRepository;

  const CloseFavoriteUseCase(this._favoritesRepository);

  Future<void> call() {
    return _favoritesRepository.close();
  }
}
