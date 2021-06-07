part of 'delete_cart_order_bloc.dart';

@immutable
abstract class DeleteCartOrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class DeleteCartOrderInitial extends DeleteCartOrderState {}

class DeleteCartOrderLoading extends DeleteCartOrderState {}

class DeleteCartOrderSuccess extends DeleteCartOrderState {}

class DeleteCartOrderError extends DeleteCartOrderState {
  final String message;
  DeleteCartOrderError({@required this.message});

  @override
  List<Object> get props => [message];
}
