import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/score.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class PutScore extends UsecaseBase<PutSuccess, Score> {
  final RemoteDataSourceRepository repository;
  PutScore({this.repository});
  @override
  Future<Either<Failure, PutSuccess>> call(Score score) async {
    return await repository.putScore(score);
  }
}
