part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends SignUpEvent {
  final Customer customer;
  SignUpUserEvent({this.customer});
  @override
  List<Object> get props => [customer];
}
