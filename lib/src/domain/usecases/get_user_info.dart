import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetUserInfo extends UsecaseBase<Customer, int> {
  final RemoteDataSourceRepository repository;
  GetUserInfo({this.repository});
  @override
  Future<Either<Failure, Customer>> call(int userId) async {
    return await repository.getUserInfo(userId);
  }
}
