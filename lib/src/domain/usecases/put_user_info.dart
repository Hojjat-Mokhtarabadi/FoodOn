import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PutUserInfo extends UsecaseBase<Success, Customer> {
  final RemoteDataSourceRepository repository;
  PutUserInfo({this.repository});
  @override
  Future<Either<Failure, Success>> call(Customer customer) async {
    return await repository.putUserInfo(customer);
  }
}
