part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostNewCommentScoreEvent extends CommentEvent {
  final Comment comment;
  final Score score;
  PostNewCommentScoreEvent({this.comment, this.score});

  @override
  List<Object> get props => [comment, score];
}

class PutCommentScoreEvent extends CommentEvent {
  final Comment comment;
  final Score score;
  PutCommentScoreEvent({this.comment, this.score});

  @override
  List<Object> get props => [comment, score];
}

class PostNewScoreEvent extends CommentEvent {
  final Score score;
  final Comment comment;
  PostNewScoreEvent({this.score, this.comment});

  @override
  List<Object> get props => [score, comment];
}

class PostNewCommentEvent extends CommentEvent {
  final Comment comment;
  PostNewCommentEvent({this.comment});

  @override
  List<Object> get props => [comment];
}
