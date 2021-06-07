part of 'orderslist_bloc.dart';

@immutable
abstract class OrdersListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetOrdersListEvent extends OrdersListEvent {
  final userId;
  GetOrdersListEvent({this.userId});

  @override
  List<Object> get props => [userId];
}
