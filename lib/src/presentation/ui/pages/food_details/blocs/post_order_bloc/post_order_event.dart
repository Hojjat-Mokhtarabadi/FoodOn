part of 'post_order_bloc.dart';

@immutable
abstract class SetMyOrderEvent extends Equatable {}

class PostNewCartOrderEvent extends SetMyOrderEvent {
  final CartOrder order;
  PostNewCartOrderEvent({@required this.order});
  @override
  List<Object> get props => [order];
}

class PutCartOrderEvent extends SetMyOrderEvent {
  final CartOrder order;
  PutCartOrderEvent({@required this.order});
  @override
  List<Object> get props => [order];
}
