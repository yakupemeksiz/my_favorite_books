import 'package:injectable/injectable.dart';
import 'package:my_favorite_books/core/api/hive_client.dart';
import 'package:my_favorite_books/core/constants/hive_type_constants.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';

@singleton
final class FavoritesDataSource extends HiveClient<VolumeItemModel> {
  FavoritesDataSource() : super('favorite_volumes');

  @override
  void registerAdapters() {
    if (!isAdapterRegistered(HiveTypeConstants.volumeItemModel)) {
      registerAdapter<VolumeItemModel>(VolumeItemModelAdapter());
    }
    if (!isAdapterRegistered(HiveTypeConstants.volumeInfoModel)) {
      registerAdapter<VolumeInfoModel>(VolumeInfoModelAdapter());
    }
    if (!isAdapterRegistered(HiveTypeConstants.imageLinksModel)) {
      registerAdapter<ImageLinksModel>(ImageLinksModelAdapter());
    }
  }
}
