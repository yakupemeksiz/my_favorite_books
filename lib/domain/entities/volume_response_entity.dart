import 'package:equatable/equatable.dart';

final class VolumeResponseEntity extends Equatable {
  final List<VolumeItemEntity> items;
  final int totalItems;

  const VolumeResponseEntity({
    required this.items,
    required this.totalItems,
  });

  @override
  List<Object> get props => [items, totalItems];
}

final class VolumeItemEntity extends Equatable {
  final VolumeInfoEntity volumeInfo;

  const VolumeItemEntity({
    required this.volumeInfo,
  });

  @override
  List<Object> get props => [volumeInfo];
}

final class VolumeInfoEntity extends Equatable {
  final String? title;
  final String? description;
  final String? publisher;
  final String? publishedDate;
  final int? pageCount;
  final ImageLinksEntity? imageLinks;
  final List<String>? authors;

  const VolumeInfoEntity({
    this.title,
    this.description,
    this.publisher,
    this.publishedDate,
    this.pageCount,
    this.imageLinks,
    this.authors,
  });

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
}

final class ImageLinksEntity extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinksEntity({
    this.smallThumbnail,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
