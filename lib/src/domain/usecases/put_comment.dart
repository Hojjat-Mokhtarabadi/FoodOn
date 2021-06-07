import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PutComment extends UsecaseBase<PutSuccess, Comment> {
  final RemoteDataSourceRepository repository;
  PutComment({this.repository});
  @override
  Future<Either<Failure, PutSuccess>> call(Comment comment) async {
    return await repository.putComment(comment);
  }
}

class PutCommentReqModel extends Equatable {
  final Comment comment;
  PutCommentReqModel({this.comment});

  @override
  List<Object> get props => [comment];
}
