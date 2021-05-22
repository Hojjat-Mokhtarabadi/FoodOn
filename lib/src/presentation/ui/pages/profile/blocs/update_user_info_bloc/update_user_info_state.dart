part of 'update_user_info_bloc.dart';

abstract class UpdateUserInfoState extends Equatable {
  const UpdateUserInfoState();

  @override
  List<Object> get props => [];
}

class UpdateUserInfoInitial extends UpdateUserInfoState {}

class UpdateUserInfoLoading extends UpdateUserInfoState {}

class UpdateUserInfoSuccess extends UpdateUserInfoState {}

class UpdateUserInfoError extends UpdateUserInfoState {
  final String msg;
  UpdateUserInfoError({this.msg});

  @override
  List<Object> get props => [msg];
}
