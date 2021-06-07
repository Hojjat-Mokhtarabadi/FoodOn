import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/get_bill_details.dart';
import 'package:foodon/src/domain/usecases/get_user_bills.dart';
import 'package:meta/meta.dart';

import '../../../../../../constants.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillDetailsBloc extends Bloc<BillEvent, BillState> {
  final GetBillDetails getBillDetails;
  BillDetailsBloc({this.getBillDetails}) : super(BillInitial());

  @override
  Stream<BillState> mapEventToState(
    BillEvent event,
  ) async* {
    if (event is GetBillDetailsEvent) {
      yield BillDetailsLoading();
      final result =
          await getBillDetails.call(BillReqModel(billId: event.billId));
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield BillDetailsError(msg: kServerErrorMsg);
        } else {
          yield BillDetailsError(msg: kNoConnectionMsg);
        }
      }, (billDetails) async* {
        yield BillDetailsLoaded(billDetails: billDetails);
      });
    }
  }
}
