import 'package:equatable/equatable.dart';
import 'package:my_favorite_books/data/models/volume_request_model.dart';

base class VolumesRequestEntity extends Equatable {
  /// Term to search
  final String query;

  /// Index of the first result to return (starts at 0)
  final int startIndex;

  /// Maximum number of results to return (max 40)
  final int maxResults;

  const VolumesRequestEntity({
    required this.query,
    this.startIndex = 0,
    this.maxResults = 10,
  });

  @override
  List<Object?> get props => [query, startIndex, maxResults];

  VolumesRequestModel toModel() {
    return VolumesRequestModel(
      query: query,
      startIndex: startIndex,
      maxResults: maxResults,
    );
  }
}
