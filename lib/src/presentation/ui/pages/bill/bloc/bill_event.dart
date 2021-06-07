part of 'bill_bloc.dart';

@immutable
abstract class BillEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBillDetailsEvent extends BillEvent {
  final billId;
  GetBillDetailsEvent({this.billId});
  @override
  List<Object> get props => [billId];
}
