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
  LoginSuccess({this.customer});

  @override
  List<Object> get props => [customer];
}

class LoginError extends LoginState {
  final String message;
  LoginError({@required this.message});

  @override
  List<Object> get props => [message];
}
