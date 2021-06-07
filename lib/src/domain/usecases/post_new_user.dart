import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PostNewUser extends UsecaseBase<PostSuccess, Customer> {
  final RemoteDataSourceRepository repository;
  PostNewUser({this.repository});
  @override
  Future<Either<Failure, PostSuccess>> call(Customer customer) async {
    final a = await repository.postNewUser(customer);
    return a;
  }
}
