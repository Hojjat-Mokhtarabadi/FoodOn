part of 'post_order_bloc.dart';

@immutable
abstract class PostOrderEvent extends Equatable {}

class PostNewOrderEvent extends PostOrderEvent {
  final Order order;
  PostNewOrderEvent({@required this.order});
  @override
  List<Object> get props => [order];
}
