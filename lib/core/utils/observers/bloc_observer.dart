import 'dart:developer';

import 'package:bloc/bloc.dart';

final class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    _log('onCreate(${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _log(
      'onError(${bloc.runtimeType}, $error, $stackTrace)',
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    _log('onClose(${bloc.runtimeType})');
    super.onClose(bloc);
  }

  /// Log the message with the bloc observer name as the logger.
  void _log(String message) {
    log(message, name: 'BlocObserver');
  }
}
