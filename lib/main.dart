import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_favorite_books/bootstrap.dart';
import 'package:my_favorite_books/core/config/flavor_config.dart';
import 'package:my_favorite_books/core/utils/extensions/context_extensions.dart';
import 'package:my_favorite_books/presentation/widgets/flavor_banner.dart';
import 'package:my_favorite_books/routers/app_router.dart';

void main() async {
  await bootstrap(
    () => FlavorBanner(
      message: FlavorConfig.currentFlavor.toUpperCase(),
      child: App(),
    ),
  );
}

final class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          builder: (context, child) {
            return Scaffold(
              body: child,
              endDrawer: SizedBox(
                width: context.width * 0.8,
                child: const FancyDioInspectorView(),
              ),
            );
          },
          themeMode: ThemeMode.light,
          // theme: ThemeData(
          //   fontFamily: 'Inter',
          //   extensions: [
          //     TextThemeExtension.light,
          //     AssetThemeExtension.light,
          //     ColorThemeExtension.light,
          //     WidgetThemeExtension.light,
          //   ],
          // ),
          // supportedLocales: context.supportedLocales,
          // localizationsDelegates: context.localizationDelegates,
        );
      },
    );
  }
}
