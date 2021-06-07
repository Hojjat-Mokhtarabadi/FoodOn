part of 'bill_bloc.dart';

@immutable
abstract class BillState extends Equatable {
  @override
  List<Object> get props => [];
}

class BillInitial extends BillState {}

class BillDetailsLoading extends BillState {}

class BillDetailsLoaded extends BillState {
  final BillDetailsModel billDetails;
  BillDetailsLoaded({this.billDetails});

  @override
  List<Object> get props => [billDetails];
}

class BillDetailsError extends BillState {
  final String msg;
  BillDetailsError({this.msg});

  @override
  List<Object> get props => [msg];
}
