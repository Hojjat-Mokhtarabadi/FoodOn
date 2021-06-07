import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/data/models/food/score.dart';
import 'package:foodon/src/domain/usecases/post_new_comment.dart';
import 'package:foodon/src/domain/usecases/post_new_score.dart';
import 'package:foodon/src/domain/usecases/put_comment.dart';
import 'package:foodon/src/domain/usecases/put_score.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final PostNewComment postNewComment;
  final PostNewScore postNewScore;
  final PutComment putComment;
  final PutScore putScore;
  CommentBloc({
    this.postNewComment,
    this.postNewScore,
    this.putComment,
    this.putScore,
  }) : super(CommentInitial());

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is PostNewCommentScoreEvent) {
      yield CommentLoading();
      final commentResult = await postNewComment.call(event.comment);
      final scoreResult = await postNewScore.call(event.score);
      yield* commentResult.fold((failure) => _sendError(failure),
          (success) async* {
        yield* scoreResult.fold(
          (failure) => _sendError(failure),
          (success) async* {
            yield CommentSuccess();
          },
        );
      });
    } else if (event is PutCommentScoreEvent) {
      yield CommentLoading();
      final commentResult = await putComment.call(event.comment);
      final scoreResult = await putScore.call(event.score);
      yield* commentResult.fold((failure) => _sendError(failure),
          (success) async* {
        yield* scoreResult.fold(
          (failure) => _sendError(failure),
          (success) async* {
            yield CommentSuccess();
          },
        );
      });
    }
  }

  Stream _sendError(Failure failure) async* {
    if (failure is ServerFailure) {
      yield CommentError(msg: kServerErrorMsg);
    } else {
      yield CommentError(msg: kNoConnectionMsg);
    }
  }
}
