import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class DeleteCartOrder extends UsecaseBase<DeleteSuccess, CartOrder> {
  final RemoteDataSourceRepository repository;
  DeleteCartOrder({this.repository});
  @override
  Future<Either<Failure, DeleteSuccess>> call(CartOrder order) async {
    return await repository.deleteCartOrder(order);
  }
}
