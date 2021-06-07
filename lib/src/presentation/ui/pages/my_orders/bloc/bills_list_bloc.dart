import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/domain/usecases/get_user_bills.dart';
import 'package:meta/meta.dart';

import '../../../../../../constants.dart';

part 'bills_list_event.dart';
part 'bills_list_state.dart';

class BillsListBloc extends Bloc<BillsListEvent, BillsListState> {
  final GetUserBills getUserBills;
  BillsListBloc({this.getUserBills}) : super(BillsListInitial());

  @override
  Stream<BillsListState> mapEventToState(
    BillsListEvent event,
  ) async* {
    if (event is GetBillsListEvent) {
      yield BillsListLoading();
      final result =
          await getUserBills.call(BillReqModel(userId: event.userId));
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield BillsListError(msg: kServerErrorMsg);
        } else {
          yield BillsListError(msg: kNoConnectionMsg);
        }
      }, (billsList) async* {
        yield BillsListLoaded(bills: billsList);
      });
    }
  }
}
