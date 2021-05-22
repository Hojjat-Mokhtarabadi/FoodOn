import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class DeleteUser extends UsecaseBase<DeleteSuccess, int> {
  final RemoteDataSourceRepository repository;
  DeleteUser({this.repository});
  @override
  Future<Either<Failure, DeleteSuccess>> call(int userId) async {
    return await repository.deleteUser(userId);
  }
}
