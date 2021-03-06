import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetPopularFoods extends UsecaseBase<List<Food>, NoParams> {
  final RemoteDataSourceRepository repository;
  GetPopularFoods({@required this.repository});

  @override
  Future<Either<Failure, List<Food>>> call(NoParams params) async {
    return await repository.getPopularFoods();
  }
}
