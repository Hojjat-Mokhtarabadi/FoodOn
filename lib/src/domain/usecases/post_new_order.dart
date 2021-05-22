import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/order.dart' as order;
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PostNewOrder extends UsecaseBase<void, order.Order> {
  final RemoteDataSourceRepository repository;
  PostNewOrder({@required this.repository});
  @override
  Future<Either<Failure, void>> call(order.Order params) async {
    final a = await repository.postNewOrder(params);
    print(a);
    return a;
  }
}
