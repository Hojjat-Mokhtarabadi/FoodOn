import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/domain/usecases/post_new_order.dart';
import 'package:foodon/src/domain/usecases/put_cart_order.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'post_order_event.dart';
part 'post_order_state.dart';

class SetCartOrderBloc extends Bloc<SetMyOrderEvent, SetMyOrderState> {
  final PostNewOrder postNewOrder;
  final PutCartOrder putCartOrder;
  SetCartOrderBloc({
    this.postNewOrder,
    this.putCartOrder,
  }) : super(SetMyOrderInitial());

  @override
  Stream<SetMyOrderState> mapEventToState(
    SetMyOrderEvent event,
  ) async* {
    if (event is PostNewCartOrderEvent) {
      yield SetCartOrderLoading();
      final result = await postNewOrder.call(event.order);
      yield* result.fold(
        (failure) => _sendError(failure),
        (success) async* {
          yield SetCartOrderSuccess();
        },
      );
    } else if (event is PutCartOrderEvent) {
      yield SetCartOrderLoading();
      print(event.order);
      final result = await putCartOrder.call(event.order);
      yield* result.fold(
        (failure) => _sendError(failure),
        (success) async* {
          yield SetCartOrderSuccess();
        },
      );
    }
  }

  Stream _sendError(failure) async* {
    if (failure is ServerFailure) {
      yield SetCartOrderError(msg: kServerErrorMsg);
    } else {
      yield SetCartOrderError(msg: kNoConnectionMsg);
    }
  }
}
