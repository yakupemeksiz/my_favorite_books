part of 'favorites_cubit.dart';

sealed class FavoritesState extends BaseState {
  const FavoritesState();

  @override
  List<Object> get props => [];

  Widget when({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(FavoritesLoaded state) loaded,
    required Widget Function(String message) error,
  }) {
    return switch (this) {
      FavoritesInitial() => initial(),
      FavoritesLoading() => loading(),
      FavoritesLoaded() => loaded(this as FavoritesLoaded),
      FavoritesError() => error((this as FavoritesError).message),
    };
  }
}

final class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
}

final class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

final class FavoritesLoaded extends FavoritesState {
  final List<VolumeItemEntity> favoriteVolumes;
  const FavoritesLoaded({
    required this.favoriteVolumes,
  });

  FavoritesLoaded copyWith({
    List<VolumeItemEntity>? favoriteVolumes,
  }) {
    return FavoritesLoaded(
      favoriteVolumes: favoriteVolumes ?? this.favoriteVolumes,
    );
  }

  @override
  List<Object> get props => [favoriteVolumes];
}

final class FavoritesError extends FavoritesState {
  final String message;
  const FavoritesError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
