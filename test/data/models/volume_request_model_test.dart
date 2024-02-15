import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.dart';

void main() {
  test('should be a subclass of Equatable', () {
    expect(dummyVolumeResponseModel, isA<Equatable>());
  });

  test('should return a json map containing proper data', () {
    final result = volumesRequestModel.toJson();

    final expected = {
      'q': 'harry potter',
      'maxResults': 10,
      'startIndex': 0,
    };

    expect(result, expected);
  });
}
