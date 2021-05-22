import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/cart/order.dart' as order;
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'orderslist_event.dart';
part 'orderslist_state.dart';

class OrdersListBloc extends Bloc<OrdersListEvent, OrdersListState> {
  final GetOrdersList ordersList;
  OrdersListBloc({@required this.ordersList}) : super(OrdersListInitial()) {
    add(GetOrdersListEvent());
  }

  @override
  Stream<OrdersListState> mapEventToState(
    OrdersListEvent event,
  ) async* {
    yield OrdersListLoading();
    final result = await ordersList.call(NoParams());
    yield* result.fold((failure) async* {
      if (failure is ServerFailure) {
        yield OrdersListError(msg: kServerErrorMsg);
      } else {
        yield OrdersListError(msg: kNoConnectionMsg);
      }
    }, (ordersList) async* {
      yield OrdersListLoaded(orders: ordersList);
    });
  }
}
