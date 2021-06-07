part of 'delete_cart_order_bloc.dart';

@immutable
abstract class DeleteCartOrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteSelectedOrderEvent extends DeleteCartOrderEvent {
  final CartOrder order;
  DeleteSelectedOrderEvent({this.order});

  @override
  List<Object> get props => [order];
}
