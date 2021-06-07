part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Customer customer;
  final int cartId;
  LoginSuccess({this.customer, this.cartId});

  @override
  List<Object> get props => [customer, cartId];
}

class LoginError extends LoginState {
  final String message;
  LoginError({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoginNoConnectionError extends LoginState {}
