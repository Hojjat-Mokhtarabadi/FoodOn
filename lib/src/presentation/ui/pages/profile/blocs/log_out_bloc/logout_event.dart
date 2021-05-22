part of 'logout_bloc.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();
  @override
  List<Object> get props => [];
}

class LogOutUserEvent extends LogoutEvent {
  final userId;
  LogOutUserEvent({this.userId});

  @override
  List<Object> get props => [userId];
}
