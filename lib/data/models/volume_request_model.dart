import 'package:my_favorite_books/domain/entities/volume_request_entity.dart';

/// This class is a model for the request of volumes
final class VolumesRequestModel extends VolumesRequestEntity {
  const VolumesRequestModel({
    /// Term to search
    required super.query,

    /// Index of the first result to return (starts at 0)
    /// Default: 0
    super.startIndex,

    /// Maximum number of results to return (max 40)
    /// Default: 10
    super.maxResults,
  })  : assert(maxResults <= 40, 'maxResults must be less than or equal to 40'),
        assert(maxResults > 0, 'maxResults must be greater than 0');

  Map<String, dynamic> toJson() {
    return {
      'q': super.query,
      'startIndex': super.startIndex,
      'maxResults': super.maxResults,
    };
  }
}
