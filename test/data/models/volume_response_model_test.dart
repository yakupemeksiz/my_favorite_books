import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_favorite_books/data/models/volume_response_model.dart';

import '../../helpers/test_helper.dart';

void main() {
  test('should be a subclass of Equatable', () {
    expect(dummyVolumeResponseModel, isA<Equatable>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonVolumesData);
    final result = VolumeResponseModel.fromJson(jsonMap);
    expect(result, equals(dummyVolumeResponseModel));
  });
}
