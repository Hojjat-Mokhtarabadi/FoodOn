import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/bill/order.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/domain/usecases/post_new_bill.dart';
import 'package:foodon/src/domain/usecases/post_new_bill_orders.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final PostNewBill postNewBill;
  final PostNewBillOrders postNewBillOrders;
  final ClearCart clearCart;
  CheckoutBloc({
    this.postNewBill,
    this.postNewBillOrders,
    this.clearCart,
  }) : super(CheckoutInitial());

  @override
  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    if (event is CheckoutOrdersEvent) {
      yield CheckoutLoading();
      final clearResult = await clearCart.call(event.cartInfo);
      yield* clearResult.fold((failure) => _sendError(failure),
          (clearSuccess) async* {
        final postBillResult = await postNewBill.call(event.bill);
        yield* postBillResult.fold((failure) => _sendError(failure),
            (postBillSuccess) async* {
          print('che sec bill blc');
          final String billId = postBillSuccess.postedItemId;
          print(billId.runtimeType);
          print(billId);
          int billIdInt = int.parse(billId);
          print(billIdInt);
          final ordersList = event.cartOrdersList
              .map(
                (e) => BillOrder(
                  (c) => c
                    ..orderId = billIdInt
                    ..foodId = e.foodId
                    ..count = e.count
                    ..price = e.price,
                ),
              )
              .toList();
          final postOrdersResult = await postNewBillOrders.call(ordersList);
          print(postOrdersResult);
          yield* postOrdersResult.fold((failure) => _sendError(failure),
              (postOrdersSuccess) async* {
            print('che suc orders blc');
            yield CheckoutSuccess(billId: billIdInt);
          });
        });
      });
    }
  }

  Stream _sendError(Failure failure) async* {
    if (failure is ServerFailure) {
      yield CheckoutError(msg: kServerErrorMsg);
    } else {
      yield CheckoutError(msg: kNoConnectionMsg);
    }
  }
}
