import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/local/favorites_repository.dart';

@injectable
final class GetFavoritesUseCase {
  final FavoritesRepository _favoritesRepository;

  const GetFavoritesUseCase(this._favoritesRepository);

  List<VolumeItemEntity> call() {
    return _favoritesRepository.getFavorites();
  }
}
