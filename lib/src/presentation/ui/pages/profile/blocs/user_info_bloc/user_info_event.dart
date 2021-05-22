part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfoEvent extends UserInfoEvent {
  final int userId;
  GetUserInfoEvent({this.userId});

  @override
  List<Object> get props => [userId];
}
