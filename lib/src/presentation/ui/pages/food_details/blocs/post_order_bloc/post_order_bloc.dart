import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/cart/order.dart';
import 'package:foodon/src/domain/usecases/post_new_order.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'post_order_event.dart';
part 'post_order_state.dart';

class PostOrderBloc extends Bloc<PostOrderEvent, PostOrderState> {
  final PostNewOrder postNewOrder;
  PostOrderBloc({this.postNewOrder}) : super(PostOrderInitial());

  @override
  Stream<PostOrderState> mapEventToState(
    PostOrderEvent event,
  ) async* {
    if (event is PostNewOrderEvent) {
      yield PostOrderLoading();
      final result = await postNewOrder.call(event.order);
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield PostOrderError(msg: kServerErrorMsg);
        } else {
          yield PostOrderError(msg: kNoConnectionMsg);
        }
      }, (success) async* {
        yield PostOrderLoaded();
      });
    }
  }
}
