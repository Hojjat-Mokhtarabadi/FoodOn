part of 'update_user_info_bloc.dart';

abstract class UpdateUserInfoEvent extends Equatable {
  UpdateUserInfoEvent();

  @override
  List<Object> get props => [];
}

class UpdateCurrentUserInfoEvent extends UpdateUserInfoEvent {
  final Customer customer;
  UpdateCurrentUserInfoEvent({this.customer});

  @override
  List<Object> get props => [customer];
}
