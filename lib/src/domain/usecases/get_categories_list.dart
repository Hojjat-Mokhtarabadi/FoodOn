import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/category/category.dart' as ct;
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';
import 'package:meta/meta.dart';

class GetCategoriesList extends UsecaseBase<List<ct.Category>, NoParams> {
  final RemoteDataSourceRepository repository;
  GetCategoriesList({@required this.repository});

  @override
  Future<Either<Failure, List<ct.Category>>> call(NoParams params) async {
    return await repository.getCategoriesList();
  }
}
