import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetUserAuthentication
    extends UsecaseBase<AuthenticationPair<Customer, int>, User> {
  final RemoteDataSourceRepository repository;
  GetUserAuthentication({this.repository});
  @override
  Future<Either<Failure, AuthenticationPair<Customer, int>>> call(
      User user) async {
    return await repository.getUserAuthentication(user);
  }
}

class User extends Equatable {
  final String userName;
  final String password;
  User({this.userName, this.password});
  @override
  List<Object> get props => [userName, password];
}

class AuthenticationPair<T1, T2> {
  final T1 userInfo;
  final T2 cartId;

  AuthenticationPair({this.userInfo, this.cartId});
}
