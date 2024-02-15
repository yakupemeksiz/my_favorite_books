import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_favorite_books/core/constants/hive_type_constants.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';

part 'volume_response_model.g.dart';

/// Volume response model class
final class VolumeResponseModel extends Equatable {
  final List<VolumeItemModel>? items;
  final int totalItems;

  const VolumeResponseModel({
    required this.items,
    required this.totalItems,
  });

  factory VolumeResponseModel.fromJson(Map<String, dynamic> json) {
    return VolumeResponseModel(
      totalItems: json['totalItems']?.toInt() as int,
      items: json.containsKey('items')
          ? List<VolumeItemModel>.from(
              json['items']?.map(
                (dynamic x) => VolumeItemModel.fromJson(x),
              ),
            )
          : null,
    );
  }

  @override
  String toString() => '''VolumeResponseModel(items: $items)''';

  @override
  List<Object?> get props => [items, totalItems];

  VolumeResponseEntity toEntity() {
    return VolumeResponseEntity(
      totalItems: totalItems,
      items: items?.map((e) => e.toEntity()).toList(),
    );
  }
}

@HiveType(typeId: HiveTypeConstants.volumeItemModel)
final class VolumeItemModel extends Equatable {
  @HiveField(0)
  final VolumeInfoModel volumeInfo;
  @HiveField(1)
  final String id;
  const VolumeItemModel({
    required this.volumeInfo,
    required this.id,
  });

  factory VolumeItemModel.fromJson(Map<String, dynamic> json) {
    return VolumeItemModel(
      volumeInfo:
          VolumeInfoModel.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      id: json['id'] as String,
    );
  }

  @override
  String toString() => '''VolumeItemModel(volumeInfo: $volumeInfo, id: $id)''';

  @override
  List<Object> get props => [volumeInfo];

  VolumeItemEntity toEntity() {
    return VolumeItemEntity(
      volumeInfo: volumeInfo.toEntity(),
      id: id,
    );
  }
}

@HiveType(typeId: HiveTypeConstants.volumeInfoModel)
final class VolumeInfoModel extends Equatable {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? publisher;
  @HiveField(3)
  final String? publishedDate;
  @HiveField(4)
  final int? pageCount;
  @HiveField(5)
  final ImageLinksModel? imageLinks;
  @HiveField(6)
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

@HiveType(typeId: HiveTypeConstants.imageLinksModel)
final class ImageLinksModel extends Equatable {
  @HiveField(0)
  final String? smallThumbnail;
  @HiveField(1)
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
