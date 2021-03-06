part of 'orderslist_bloc.dart';

@immutable
abstract class OrdersListState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrdersListInitial extends OrdersListState {}

class OrdersListLoading extends OrdersListState {}

class OrdersListLoaded extends OrdersListState {
  final List<CartOrdersView> orders;
  OrdersListLoaded({this.orders});

  @override
  List<Object> get props => [orders];
}

class OrdersListNotFound extends OrdersListState {}

class OrdersListError extends OrdersListState {
  final String msg;
  OrdersListError({this.msg});

  @override
  List<Object> get props => [msg];
}
