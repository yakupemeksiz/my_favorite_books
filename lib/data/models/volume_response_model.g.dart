// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeItemModelAdapter extends TypeAdapter<VolumeItemModel> {
  @override
  final int typeId = 1;

  @override
  VolumeItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeItemModel(
      volumeInfo: fields[0] as VolumeInfoModel,
      id: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeItemModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.volumeInfo)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VolumeInfoModelAdapter extends TypeAdapter<VolumeInfoModel> {
  @override
  final int typeId = 3;

  @override
  VolumeInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfoModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      publisher: fields[2] as String?,
      publishedDate: fields[3] as String?,
      pageCount: fields[4] as int?,
      imageLinks: fields[5] as ImageLinksModel?,
      authors: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.pageCount)
      ..writeByte(5)
      ..write(obj.imageLinks)
      ..writeByte(6)
      ..write(obj.authors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageLinksModelAdapter extends TypeAdapter<ImageLinksModel> {
  @override
  final int typeId = 2;

  @override
  ImageLinksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinksModel(
      smallThumbnail: fields[0] as String?,
      thumbnail: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinksModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.smallThumbnail)
      ..writeByte(1)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
