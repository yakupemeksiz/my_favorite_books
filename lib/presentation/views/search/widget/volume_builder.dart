part of '../search_view.dart';

final class _VolumeBuilderWidget
    extends BaseWidget<SearchCubit, SearchBaseState> {
  const _VolumeBuilderWidget();

  @override
  Widget build(
    BuildContext context,
    SearchCubit cubit,
    SearchBaseState state,
  ) {
    return state.when(
      initial: () => Center(
        child: Text('📘', style: TextStyle(fontSize: 72.sp)),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      loaded: (state) => _loaded(context, cubit, state),
      error: (message) => _error(message, context),
    );
  }

  Widget _loaded(BuildContext context, SearchCubit cubit, SearchLoaded state) {
    if (state.volumeResponseEntity.items == null ||
        state.volumeResponseEntity.items!.isEmpty) {
      return Center(
        child: Text(
          LocaleKeyConstants.noBooksFound,
          style: context.textTheme.titleMedium,
        ),
      );
    }
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: context.bottomOrDefaultPadding),
        itemCount: state.volumeResponseEntity.items!.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) => Gap(16.h),
        itemBuilder: (context, index) {
          final volume = state.volumeResponseEntity.items![index];

          return VolumeTileWidget(
            volume: volume,
            isFavorite: state.favoriteVolumes.contains(volume),
            onLongPress: cubit.removeFromFavorites,
            onDoubleTap: cubit.addToFavorites,
          );
        },
      ),
    );
  }

  Widget _error(String? message, BuildContext context) {
    return Center(
      child: Text(
        message ?? LocaleKeyConstants.somethingWentWrong,
        style: context.textTheme.bodyMedium?.copyWith(
          color: ColorConstants.errorColor,
        ),
      ),
    );
  }
}
