part of 'post_order_bloc.dart';

@immutable
abstract class SetMyOrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class SetMyOrderInitial extends SetMyOrderState {}

class SetCartOrderLoading extends SetMyOrderState {}

class SetCartOrderSuccess extends SetMyOrderState {}

class SetCartOrderError extends SetMyOrderState {
  final String msg;
  SetCartOrderError({this.msg});

  @override
  List<Object> get props => [msg];
}
