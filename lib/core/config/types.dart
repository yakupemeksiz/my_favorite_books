import 'package:either_dart/either.dart';
import 'package:my_favorite_books/core/error/failure.dart';

/// A type definition for a remote fetch result.
/// It is a [Future] of [Either] of [Failure] and [T].
/// [T] is a generic type that extends [Object].
/// [T] is the type of the result of the remote fetch operation.
/// [Failure] is the type of the error that can occur during the remote fetch
/// operation.

typedef RemoteFetchResult<T extends Object?> = Future<Either<Failure?, T>>;
