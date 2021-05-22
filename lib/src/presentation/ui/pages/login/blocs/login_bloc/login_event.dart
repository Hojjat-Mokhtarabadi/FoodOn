part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class GetUserAuthenticationEvent extends LoginEvent {
  final User user;
  GetUserAuthenticationEvent({this.user});

  @override
  List<Object> get props => [user];
}
