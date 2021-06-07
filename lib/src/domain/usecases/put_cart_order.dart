import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PutCartOrder extends UsecaseBase<PutSuccess, CartOrder> {
  final RemoteDataSourceRepository repository;
  PutCartOrder({this.repository});
  @override
  Future<Either<Failure, PutSuccess>> call(CartOrder cartOrder) async {
    return await repository.putCartOrder(cartOrder);
  }
}
