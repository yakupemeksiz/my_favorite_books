import 'package:equatable/equatable.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';

final class VolumeResponseEntity extends Equatable {
  final List<VolumeItemEntity>? items;
  final int totalItems;

  const VolumeResponseEntity({
    required this.items,
    required this.totalItems,
  });

  @override
  List<Object?> get props => [items, totalItems];
}

final class VolumeItemEntity extends Equatable {
  final VolumeInfoEntity volumeInfo;
  final String id;

  const VolumeItemEntity({
    required this.volumeInfo,
    required this.id,
  });

  @override
  List<Object> get props => [volumeInfo, id];

  VolumeItemModel toModel() {
    return VolumeItemModel(
      id: id,
      volumeInfo: volumeInfo.toModel(),
    );
  }
}

final class VolumeInfoEntity extends Equatable {
  final String? title;
  final String? description;
  final String? publisher;
  final String? publishedDate;
  final int? pageCount;
  final ImageLinksEntity? imageLinks;
  final List<String>? authors;

  String? get author => authors?.join(', ');

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

  VolumeInfoModel toModel() {
    return VolumeInfoModel(
      title: title,
      description: description,
      publisher: publisher,
      publishedDate: publishedDate,
      pageCount: pageCount,
      imageLinks: imageLinks?.toModel(),
      authors: authors,
    );
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

  ImageLinksModel toModel() {
    return ImageLinksModel(
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
    );
  }
}
