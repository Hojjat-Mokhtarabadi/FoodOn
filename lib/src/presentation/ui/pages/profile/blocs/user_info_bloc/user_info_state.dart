part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final Customer user;
  UserInfoLoaded({this.user});

  @override
  List<Object> get props => [user];
}

class UserInfoError extends UserInfoState {
  final String msg;
  UserInfoError({this.msg});

  @override
  List<Object> get props => [msg];
}
