import 'package:equatable/equatable.dart';

/// Base class for all failures in the app.
abstract base class Failure extends Equatable {
  /// The error message of the failure.
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// A failure that occurs when the server returns an error.
final class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] with the specified error [message].
  const ServerFailure(super.message);
}

/// A failure that occurs when the device has no internet.
final class ConnectionFailure extends Failure {
  /// Constructs a [ConnectionFailure] with the specified error [message].
  const ConnectionFailure(super.message);
}

/// A failure that occurs when the database returns an error.
final class DatabaseFailure extends Failure {
  /// Constructs a [DatabaseFailure] with the specified error [message].
  const DatabaseFailure(super.message);
}

/// A failure that occurs when the request times out.
final class TimeoutFailure extends Failure {
  /// Constructs a [TimeoutFailure] with the specified error [message].
  const TimeoutFailure(super.message);
}

/// A failure that represents other unknown failures.
final class UnknownFailure extends Failure {
  /// Constructs an [UnknownFailure] with the specified error [message].
  const UnknownFailure(super.message);
}
