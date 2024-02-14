import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:my_favorite_books/core/error/failure.dart';

/// Network handler mixin to handle network exceptions
mixin NetworkHandlerMixin {
  Future<Either<Failure?, R>> networkHandler<R extends Object?>(
    Future<R> Function() f,
  ) async {
    try {
      return Right(await f());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(
        switch (e.type) {
          DioExceptionType.connectionTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.receiveTimeout =>
            const TimeoutFailure('Timeout failure'),
          DioExceptionType.badCertificate ||
          DioExceptionType.badResponse ||
          DioExceptionType.connectionError =>
            const ConnectionFailure('Connection failure'),
          DioExceptionType.cancel => null,
          DioExceptionType.unknown => const UnknownFailure('Unknown failure'),
        },
      );
    } catch (s) {
      return const Left(UnknownFailure('Unknown failure'));
    }
  }
}
