import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetFoodImages {
  final RemoteDataSourceRepository repository;
  GetFoodImages({this.repository});

  Future<List<FirebaseFileModel>> getFoodImages(String path) async {
    return await repository.getFoodImages(path);
  }
}
