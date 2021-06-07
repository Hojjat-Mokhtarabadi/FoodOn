part of 'get_comments_bloc.dart';

@immutable
abstract class CommentsState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final CommentsListModel cm;

  CommentsLoaded({this.cm});

  @override
  List<Object> get props => [cm];
}

class CommentsNotFoundError extends CommentsState {}

class CommentsError extends CommentsState {
  final String message;
  CommentsError({@required this.message});

  @override
  List<Object> get props => [message];
}
