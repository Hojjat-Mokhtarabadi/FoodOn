import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/score.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetUserScore extends UsecaseBase<Score, Score> {
  final RemoteDataSourceRepository repository;
  GetUserScore({this.repository});
  @override
  Future<Either<Failure, Score>> call(Score scoreIdsInfo) async {
    return await repository.getUserScore(scoreIdsInfo);
  }
}
