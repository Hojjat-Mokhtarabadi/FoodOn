import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetOrdersList extends UsecaseBase<List<CartOrdersView>, CartItemsModel> {
  final RemoteDataSourceRepository repository;
  GetOrdersList({@required this.repository});

  @override
  Future<Either<Failure, List<CartOrdersView>>> call(
      CartItemsModel cartItems) async {
    return await repository.getOrdersList(cartItems);
  }
}

class CartItemsModel extends Equatable {
  final int userId;
  CartItemsModel({this.userId});

  @override
  List<Object> get props => [userId];
}
