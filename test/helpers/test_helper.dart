import 'package:mockito/annotations.dart';
import 'package:my_favorite_books/data/data_sources/remote/volumes_data_source.dart';
import 'package:my_favorite_books/domain/repositories/remote/volumes_repository.dart';

@GenerateMocks([VolumesDataSource, VolumesRepository])
void main() {}
