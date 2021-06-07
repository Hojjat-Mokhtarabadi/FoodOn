part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final int billId;
  CheckoutSuccess({this.billId});

  @override
  List<Object> get props => [billId];
}

class CheckoutError extends CheckoutState {
  final String msg;
  CheckoutError({this.msg});

  @override
  List<Object> get props => [msg];
}
