import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/domain/usecases/delete_cart_order.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'delete_cart_order_event.dart';
part 'delete_cart_order_state.dart';

class DeleteCartOrderBloc
    extends Bloc<DeleteCartOrderEvent, DeleteCartOrderState> {
  final DeleteCartOrder deleteCartOrder;
  DeleteCartOrderBloc({this.deleteCartOrder}) : super(DeleteCartOrderInitial());

  @override
  Stream<DeleteCartOrderState> mapEventToState(
    DeleteCartOrderEvent event,
  ) async* {
    if (event is DeleteSelectedOrderEvent) {
      yield DeleteCartOrderLoading();
      final result = await deleteCartOrder.call(event.order);
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield DeleteCartOrderError(message: kServerErrorMsg);
        } else if (failure is NoConnectionFailure) {
          yield DeleteCartOrderError(message: kNoConnectionMsg);
        }
      }, (success) async* {
        yield DeleteCartOrderSuccess();
      });
    }
  }
}
