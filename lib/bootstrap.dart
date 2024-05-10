part of '../main.dart';

/// Bootstrap the app with the given builder function
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  /// Run the app in a zone to catch all errors and log them to the console
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = const AppBlocObserver();

    /// Set the preferred orientations
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /// Set the logger for EasyLocalization
    EasyLocalization.logger.printer =
        (object, {level, name, stackTrace}) => log('$name: $object');

    /// Initialize EasyLocalization
    await EasyLocalization.ensureInitialized();

    /// Load environment variables from .env file
    await dotenv.load();

    /// Configure dependencies using injectable
    configureDependencies();

    /// Initialize Hive
    await Hive.initFlutter();

    await getIt<FavoritesDataSource>().init();

    /// Run the app with EasyLocalization
    runApp(LocalizationConfig.runAppWithEasyWidget(await builder()));
  }, (error, stack) {
    log(error.toString(), stackTrace: stack, name: 'bootstrap');
  });

  /// Log all errors to the console
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };
}
