import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PostNewOrder extends UsecaseBase<PostSuccess, CartOrder> {
  final RemoteDataSourceRepository repository;
  PostNewOrder({@required this.repository});
  @override
  Future<Either<Failure, PostSuccess>> call(CartOrder order) async {
    return await repository.postNewOrder(order);
  }
}
