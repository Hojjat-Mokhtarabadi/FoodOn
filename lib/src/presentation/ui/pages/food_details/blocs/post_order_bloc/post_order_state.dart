part of 'post_order_bloc.dart';

@immutable
abstract class PostOrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostOrderInitial extends PostOrderState {}

class PostOrderLoading extends PostOrderState {}

class PostOrderLoaded extends PostOrderState {}

class PostOrderError extends PostOrderState {
  final String msg;
  PostOrderError({this.msg});

  @override
  List<Object> get props => [msg];
}
