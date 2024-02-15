part of 'search_cubit.dart';

sealed class SearchBaseState extends BaseState {
  const SearchBaseState();

  Widget when({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(SearchLoaded state) loaded,
    required Widget Function(String? message) error,
  }) {
    return switch (this) {
      SearchInitial() => initial(),
      SearchLoading() => loading(),
      SearchLoaded() => loaded(this as SearchLoaded),
      SearchError() => error((this as SearchError).message),
    };
  }

  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchBaseState {
  const SearchInitial();
}

final class SearchLoading extends SearchBaseState {
  const SearchLoading();
}

final class SearchLoaded extends SearchBaseState {
  final VolumeResponseEntity volumeResponseEntity;
  final List<VolumeItemEntity> favoriteVolumes;
  const SearchLoaded({
    required this.volumeResponseEntity,
    required this.favoriteVolumes,
  });

  SearchLoaded copyWith({
    VolumeResponseEntity? volumeResponseEntity,
    List<VolumeItemEntity>? favoriteVolumes,
  }) {
    return SearchLoaded(
      volumeResponseEntity: volumeResponseEntity ?? this.volumeResponseEntity,
      favoriteVolumes: favoriteVolumes ?? this.favoriteVolumes,
    );
  }

  @override
  List<Object?> get props => [volumeResponseEntity, favoriteVolumes];
}

final class SearchError extends SearchBaseState {
  final String? message;
  const SearchError({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}
