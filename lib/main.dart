import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_favorite_books/core/config/flavor_config.dart';
import 'package:my_favorite_books/core/config/localization_config.dart';
import 'package:my_favorite_books/core/utils/observers/bloc_observer.dart';
import 'package:my_favorite_books/data/data_sources/local/favorites_data_source.dart';
import 'package:my_favorite_books/inject.dart';
import 'package:my_favorite_books/presentation/theme/theme_data.dart';
import 'package:my_favorite_books/presentation/widgets/flavor_banner.dart';
import 'package:my_favorite_books/routers/app_router.dart';

part 'bootstrap.dart';

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
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: MaterialApp.router(
            routerConfig: _appRouter.config(),
            themeMode: ThemeMode.dark,
            theme: AppThemeData.appTheme,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
          ),
        );
      },
    );
  }
}
