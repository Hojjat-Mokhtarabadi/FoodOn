import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'get_comments_event.dart';
part 'get_comments_state.dart';

class CommentsBloc extends Bloc<GetCommentsEvent, CommentsState> {
  final GetCommentsScoresList getCommentsScoresList;
  CommentsBloc({this.getCommentsScoresList}) : super(CommentsInitial());

  @override
  Stream<CommentsState> mapEventToState(
    GetCommentsEvent event,
  ) async* {
    if (event is GetAllCommentsEvent) {
      yield CommentsLoading();
      final result = await getCommentsScoresList.call(event.commentsReq);
      yield* result.fold((failure) async* {
        if (failure is ServerFailure) {
          yield CommentsError(message: kServerErrorMsg);
        } else if (failure is NotFoundFailure) {
          yield CommentsNotFoundError();
        } else {
          yield CommentsError(message: kNoConnectionMsg);
        }
      }, (success) async* {
        yield CommentsLoaded(cm: success);
      });
    }
  }
}
