import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_favorite_books/core/constants/color_constants.dart';
import 'package:my_favorite_books/core/constants/locale_key_constants.dart';
import 'package:my_favorite_books/core/utils/extensions/context_extensions.dart';
import 'package:my_favorite_books/core/utils/extensions/widget_extensions.dart';
import 'package:my_favorite_books/core/view/base_view.dart';
import 'package:my_favorite_books/core/widget/base_widget.dart';
import 'package:my_favorite_books/inject.dart';
import 'package:my_favorite_books/presentation/views/search/cubit/search_cubit.dart';
import 'package:my_favorite_books/presentation/widgets/custom_app_bar.dart';
import 'package:my_favorite_books/presentation/widgets/custom_scaffold.dart';
import 'package:my_favorite_books/presentation/widgets/volume_tile.dart';
import 'package:my_favorite_books/routers/app_router.dart';

part './widget/search.dart';
part './widget/volume_builder.dart';

@RoutePage()
final class SearchView extends BaseView<SearchCubit, SearchBaseState> {
  SearchView({super.key}) : super(cubit: getIt.call);

  @override
  Widget builder(BuildContext context, SearchCubit cubit) {
    return CustomScaffold(
      body: Column(
        children: [
          Gap(context.topPadding),
          CustomAppBar(
            title: LocaleKeyConstants.appTitle,
            trailing: GestureDetector(
              onTap: () => AutoRouter.of(context).push(FavoritesRoute()),
              child: Icon(Icons.favorite, size: 28.h),
            ),
          ),
          Gap(16.h),
          _SearchWidget(onSearch: cubit.getVolumes),
          Gap(16.h),
          const Expanded(child: _VolumeBuilderWidget()),
        ],
      ).symmetricHDefaultPadding,
    );
  }
}
