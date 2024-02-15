import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_favorite_books/presentation/views/favorites/favorites_view.dart';
import 'package:my_favorite_books/presentation/views/search/search_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SearchRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: FavoritesRoute.page,
        ),
      ];
}
