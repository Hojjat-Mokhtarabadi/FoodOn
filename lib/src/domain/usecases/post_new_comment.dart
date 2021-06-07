import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PostNewComment extends UsecaseBase<PostSuccess, Comment> {
  final RemoteDataSourceRepository repository;
  PostNewComment({this.repository});
  @override
  Future<Either<Failure, PostSuccess>> call(Comment comment) async {
    return await this.repository.postNewComment(comment);
  }
}
