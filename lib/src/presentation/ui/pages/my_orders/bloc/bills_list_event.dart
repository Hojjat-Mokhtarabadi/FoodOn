part of 'bills_list_bloc.dart';

@immutable
abstract class BillsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBillsListEvent extends BillsListEvent {
  final userId;
  GetBillsListEvent({this.userId});

  @override
  List<Object> get props => [userId];
}
