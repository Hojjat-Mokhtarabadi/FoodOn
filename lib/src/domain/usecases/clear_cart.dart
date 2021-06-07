import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class ClearCart extends UsecaseBase<DeleteSuccess, ClearCartReqModel> {
  final RemoteDataSourceRepository repository;
  ClearCart({this.repository});
  @override
  Future<Either<Failure, DeleteSuccess>> call(
      ClearCartReqModel cartInfo) async {
    return await repository.clearCart(cartInfo);
  }
}

class ClearCartReqModel extends Equatable {
  final int cartId;
  ClearCartReqModel({this.cartId});

  @override
  List<Object> get props => [this.cartId];
}
