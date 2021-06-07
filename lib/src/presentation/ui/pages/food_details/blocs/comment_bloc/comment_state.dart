part of 'comment_bloc.dart';

@immutable
abstract class CommentState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentSuccess extends CommentState {}

class CommentError extends CommentState {
  final String msg;
  CommentError({this.msg});

  @override
  List<Object> get props => [msg];
}
