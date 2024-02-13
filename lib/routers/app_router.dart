import 'package:auto_route/auto_route.dart';
import 'package:my_favorite_books/presentation/views/splash/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(page: SplashRoute.page, initial: true),
      ];
}
