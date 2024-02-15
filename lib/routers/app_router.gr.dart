// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FavoritesRoute.name: (routeData) {
      final args = routeData.argsAs<FavoritesRouteArgs>(
          orElse: () => const FavoritesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavoritesView(key: args.key),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchView(key: args.key),
      );
    },
  };
}

/// generated route for
/// [FavoritesView]
class FavoritesRoute extends PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FavoritesRoute.name,
          args: FavoritesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<FavoritesRouteArgs> page =
      PageInfo<FavoritesRouteArgs>(name);
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}
