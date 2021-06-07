import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetFoodImageById {
  final RemoteDataSourceRepository repository;
  GetFoodImageById({this.repository});

  Future<List<FirebaseFileModel>> getFoodImageById(
      String path, List<int> ids) async {
    return await repository.getFoodImagesById(path, ids);
  }
}
