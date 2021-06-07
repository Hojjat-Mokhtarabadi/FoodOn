part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final int cartId;
  SignUpSuccess({this.cartId});

  @override
  List<Object> get props => [cartId];
}

class SignUpError extends SignUpState {
  final String message;
  SignUpError({@required this.message});

  @override
  List<Object> get props => [message];
}
