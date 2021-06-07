import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetCommentsScoresList
    extends UsecaseBase<CommentsListModel, CommentsReqModel> {
  final RemoteDataSourceRepository repository;
  GetCommentsScoresList({this.repository});

  Future<Either<Failure, CommentsListModel>> call(CommentsReqModel crm) async {
    return await repository.getCommentsScoresList(crm);
  }
}

class CommentsReqModel extends Equatable {
  final userId;
  final foodId;
  CommentsReqModel({this.userId, this.foodId});

  @override
  List<Object> get props => [userId, foodId];
}

class Pair<T1, T2> {
  final T1 comment;
  final T2 score;

  Pair(this.comment, this.score);
}
