import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'orderslist_event.dart';
part 'orderslist_state.dart';

class OrdersListBloc extends Bloc<OrdersListEvent, OrdersListState> {
  final GetOrdersList ordersList;
  OrdersListBloc({@required this.ordersList}) : super(OrdersListInitial());

  @override
  Stream<OrdersListState> mapEventToState(
    OrdersListEvent event,
  ) async* {
    if (event is GetOrdersListEvent) {
      yield OrdersListLoading();
      print(event.userId);
      final result =
          await ordersList.call(CartItemsModel(userId: event.userId));
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield OrdersListError(msg: kServerErrorMsg);
        } else if (failure is NotFoundFailure) {
          yield OrdersListNotFound();
        } else {
          yield OrdersListError(msg: kNoConnectionMsg);
        }
      }, (ordersList) async* {
        print('orders blc');
        print(ordersList);
        yield OrdersListLoaded(orders: ordersList);
      });
    }
  }
}
