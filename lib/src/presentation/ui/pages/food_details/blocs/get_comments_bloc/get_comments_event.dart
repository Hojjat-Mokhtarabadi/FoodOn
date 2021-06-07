part of 'get_comments_bloc.dart';

@immutable
abstract class GetCommentsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllCommentsEvent extends GetCommentsEvent {
  final CommentsReqModel commentsReq;
  GetAllCommentsEvent({this.commentsReq});

  @override
  List<Object> get props => [];
}
