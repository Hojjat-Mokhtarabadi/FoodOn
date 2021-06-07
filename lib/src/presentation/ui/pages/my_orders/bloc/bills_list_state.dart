part of 'bills_list_bloc.dart';

@immutable
abstract class BillsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class BillsListInitial extends BillsListState {}

class BillsListLoading extends BillsListState {}

class BillsListLoaded extends BillsListState {
  final List<Bill> bills;
  BillsListLoaded({this.bills});

  @override
  List<Object> get props => [bills];
}

class BillsListError extends BillsListState {
  final String msg;
  BillsListError({this.msg});

  @override
  List<Object> get props => [msg];
}
