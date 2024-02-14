import 'package:equatable/equatable.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

/// Volume response model class
final class VolumeResponseModel extends Equatable {
  final List<VolumeItemModel> items;

  final int totalItems;

  const VolumeResponseModel({
    required this.items,
    required this.totalItems,
  });

  factory VolumeResponseModel.fromJson(Map<String, dynamic> json) {
    return VolumeResponseModel(
      totalItems: json['totalItems']?.toInt() as int,
      items: List<VolumeItemModel>.from(
        json['items']?.map(
          (dynamic x) => VolumeItemModel.fromJson(x),
        ),
      ),
    );
  }

  @override
  String toString() => '''VolumeResponseModel(items: $items)''';

  @override
  List<Object> get props => [items];

  VolumeResponseEntity toEntity() {
    return VolumeResponseEntity(
      items: items.map((e) => e.toEntity()).toList(),
      totalItems: totalItems,
    );
  }
}

final class VolumeItemModel extends Equatable {
  final VolumeInfoModel volumeInfo;
  const VolumeItemModel({
    required this.volumeInfo,
  });

  factory VolumeItemModel.fromJson(Map<String, dynamic> json) {
    return VolumeItemModel(
      volumeInfo:
          VolumeInfoModel.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => '''VolumeItemModel(volumeInfo: $volumeInfo)''';

  @override
  List<Object> get props => [volumeInfo];

  VolumeItemEntity toEntity() {
    return VolumeItemEntity(
      volumeInfo: volumeInfo.toEntity(),
    );
  }
}

final class VolumeInfoModel extends Equatable {
  final String? title;
  final String? description;
  final String? publisher;
  final String? publishedDate;
  final int? pageCount;
  final ImageLinksModel? imageLinks;
  final List<String>? authors;

  const VolumeInfoModel({
    this.title,
    this.description,
    this.publisher,
    this.publishedDate,
    this.pageCount,
    this.imageLinks,
    this.authors,
  });

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) {
    return VolumeInfoModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      pageCount: json['pageCount']?.toInt() as int?,
      imageLinks: json.containsKey('imageLinks')
          ? ImageLinksModel.fromJson(json['imageLinks'] as Map<String, dynamic>)
          : null,
      authors: json.containsKey('authors') ? List.from(json['authors']) : null,
    );
  }

  @override
  String toString() {
    return '''VolumeInfoModel(title: $title, description: $description, publisher: $publisher, publishedDate: $publishedDate, pageCount: $pageCount, imageLinks: $imageLinks, authors: $authors)''';
  }

  @override
  List<Object?> get props {
    return [
      title,
      description,
      publisher,
      publishedDate,
      pageCount,
      imageLinks,
      authors,
    ];
  }

  VolumeInfoEntity toEntity() {
    return VolumeInfoEntity(
      title: title,
      description: description,
      publisher: publisher,
      publishedDate: publishedDate,
      pageCount: pageCount,
      imageLinks: imageLinks?.toEntity(),
      authors: authors,
    );
  }
}

final class ImageLinksModel extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinksModel({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinksModel.fromJson(Map<String, dynamic> json) {
    return ImageLinksModel(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );
  }

  @override
  String toString() =>
      '''ImageLinksModel(smallThumbnail: $smallThumbnail, thumbnail: $thumbnail)''';

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];

  ImageLinksEntity toEntity() {
    return ImageLinksEntity(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
    );
  }
}
