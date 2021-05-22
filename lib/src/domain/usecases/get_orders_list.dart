import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/order.dart' as order;
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetOrdersList extends UsecaseBase<List<order.Order>, NoParams> {
  final RemoteDataSourceRepository repository;
  GetOrdersList({@required this.repository});

  @override
  Future<Either<Failure, List<order.Order>>> call(NoParams noParams) async {
    return await repository.getOrdersList();
  }
}
