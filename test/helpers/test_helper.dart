import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart';
import 'package:my_favorite_books/data/models/volume_request_model.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';
import 'package:my_favorite_books/domain/entities/volume_response_entity.dart';
import 'package:my_favorite_books/domain/repositories/remote/volumes_repository.dart';

import 'json_reader.dart';

@GenerateMocks(
  [VolumesDataSource, VolumesRepository],
  customMocks: [
    MockSpec<VolumesDataSource>(as: #MockVolumesDataSource),
    MockSpec<VolumesRepository>(as: #MockVolumesRepository),
  ],
)
void main() {}

const dummyDataPath = 'helpers/dummy_data/dummy_data_volumes.json';

/// Get the dummy VolumesRequestModel
const volumesRequestModel = VolumesRequestModel(query: 'harry potter');

/// Get the dummy data from the json file
String get jsonVolumesData => readJson(dummyDataPath);

/// Get the dummy VolumeResponseModel
VolumeResponseModel get dummyVolumeResponseModel =>
    VolumeResponseModel.fromJson(
      jsonDecode(readJson(dummyDataPath)),
    );

/// Get the dummy VolumeResponseEntity
VolumeResponseEntity get dummyVolumeResponseEntity =>
    dummyVolumeResponseModel.toEntity();
