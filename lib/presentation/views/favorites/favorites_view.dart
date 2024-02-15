import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_favorite_books/core/constants/locale_key_constants.dart';
import 'package:my_favorite_books/core/utils/extensions/context_extensions.dart';
import 'package:my_favorite_books/core/utils/extensions/widget_extensions.dart';
import 'package:my_favorite_books/core/view/base_view.dart';
import 'package:my_favorite_books/core/widget/base_widget.dart';
import 'package:my_favorite_books/inject.dart';
import 'package:my_favorite_books/presentation/views/favorites/cubit/favorites_cubit.dart';
import 'package:my_favorite_books/presentation/widgets/custom_app_bar.dart';
import 'package:my_favorite_books/presentation/widgets/custom_scaffold.dart';
import 'package:my_favorite_books/presentation/widgets/volume_tile.dart';

part 'widget/favorite_builder.dart';

@RoutePage()
final class FavoritesView extends BaseView<FavoritesCubit, FavoritesState> {
  FavoritesView({super.key}) : super(cubit: getIt.call);

  @override
  Widget builder(BuildContext context, FavoritesCubit cubit) {
    return CustomScaffold(
      body: Column(
        children: [
          Gap(context.topPadding),
          CustomAppBar(
            leading: const BackButton(),
            title: LocaleKeyConstants.favoriteTitle,
          ),
          const Expanded(child: _FavoriteBuilderWidget()),
        ],
      ),
    );
  }
}
