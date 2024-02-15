import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/core/cubit/base_cubit.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/use_cases/get_favorites_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/remove_favorites_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/stream_favorites_use_case.dart';

part 'favorites_state.dart';

@injectable
final class FavoritesCubit extends BaseCubit<FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final StreamFavoritesUseCase _streamFavoritesUseCase;

  FavoritesCubit(
    this._getFavoritesUseCase,
    this._removeFavoriteUseCase,
    this._streamFavoritesUseCase,
  ) : super(const FavoritesInitial());

  late final StreamSubscription<List<VolumeItemEntity>> _subscription;

  @override
  void onBindingCreated() {
    super.onBindingCreated();
    _subscription = _streamFavoritesUseCase.call().listen((event) {
      if (state is FavoritesLoaded) {
        emit(
          (state as FavoritesLoaded).copyWith(favoriteVolumes: event),
        );
      }
    });
    getFavorites();
  }

  void getFavorites() {
    emit(const FavoritesLoading());
    final favorites = _getFavoritesUseCase.call();
    emit(FavoritesLoaded(favoriteVolumes: favorites));
  }

  void removeFavorite(VolumeItemEntity volume) {
    _removeFavoriteUseCase.call(volume.id);
    getFavorites();
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
