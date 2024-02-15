part of '../favorites_view.dart';

final class _FavoriteBuilderWidget
    extends BaseWidget<FavoritesCubit, FavoritesState> {
  const _FavoriteBuilderWidget();

  @override
  Widget build(
    BuildContext context,
    FavoritesCubit cubit,
    FavoritesState state,
  ) {
    return state.when(
      initial: () => const Center(child: Icon(Icons.book)),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      loaded: (state) => _loaded(state, cubit, context),
      error: (message) => Center(child: Text(message)),
    );
  }

  Widget _loaded(
    FavoritesLoaded state,
    FavoritesCubit cubit,
    BuildContext context,
  ) {
    if (state.favoriteVolumes.isEmpty) {
      return Center(
        child: Text(
          LocaleKeyConstants.noFavoriteBooksYet,
          style: context.textTheme.titleMedium,
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.only(top: 16.h, bottom: context.bottomPadding + 16.h),
      itemCount: state.favoriteVolumes.length,
      separatorBuilder: (context, index) => Gap(16.h),
      itemBuilder: (context, index) {
        final volume = state.favoriteVolumes[index];
        return VolumeTileWidget(
          volume: volume,
          onLongPress: cubit.removeFavorite,
        );
      },
    ).symmetricHDefaultPadding;
  }
}
