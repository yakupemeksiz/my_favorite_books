import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/core/cubit/base_cubit.dart';
import 'package:my_favorite_books/domain/entities/volume_request_entity.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/use_cases/add_favorite_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/close_favorite_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/get_favorites_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/get_volumes_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/remove_favorites_use_case.dart';
import 'package:my_favorite_books/domain/use_cases/stream_favorites_use_case.dart';

part 'search_state.dart';

@injectable
final class SearchCubit extends BaseCubit<SearchBaseState> {
  final GetVolumesUseCase _getVolumesUseCase;
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final StreamFavoritesUseCase _streamFavoritesUseCase;
  final CloseFavoriteUseCase _closeFavoriteUseCase;
  final CancelToken _cancelToken = CancelToken();

  SearchCubit(
    this._getVolumesUseCase,
    this._getFavoritesUseCase,
    this._addFavoriteUseCase,
    this._removeFavoriteUseCase,
    this._streamFavoritesUseCase,
    this._closeFavoriteUseCase,
  ) : super(const SearchInitial());

  final List<VolumeItemEntity> _favoriteVolumes = [];
  late final StreamSubscription<List<VolumeItemEntity>> _subscription;

  @override
  void onBindingCreated() {
    super.onBindingCreated();

    _subscription = _streamFavoritesUseCase.call().listen((event) {
      if (state is SearchLoaded) {
        emit(
          (state as SearchLoaded).copyWith(favoriteVolumes: event),
        );
      }
    });
  }

  Future<void> getVolumes(String text) async {
    emit(const SearchLoading());
    _favoriteVolumes
      ..clear()
      ..addAll(_getFavoritesUseCase.call());

    final res = await _getVolumesUseCase.call(
      request: VolumesRequestEntity(query: text),
      cancelToken: _cancelToken,
    );
    res.fold(
      (left) {
        emit(SearchError(message: left?.message ?? ''));
      },
      (right) => {
        emit(
          SearchLoaded(
            volumeResponseEntity: right,
            favoriteVolumes: _favoriteVolumes,
          ),
        ),
      },
    );
  }

  void addToFavorites(VolumeItemEntity entity) {
    _addFavoriteUseCase.call(entity.id, entity);
  }

  void removeFromFavorites(VolumeItemEntity entity) {
    _removeFavoriteUseCase.call(entity.id);
  }

  @override
  Future<void> close() {
    _cancelToken.cancel();
    _closeFavoriteUseCase.call();
    _subscription.cancel();
    return super.close();
  }
}
