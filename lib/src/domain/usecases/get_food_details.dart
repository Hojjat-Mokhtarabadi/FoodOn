import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetFoodDetails extends UsecaseBase<Food, int> {
  final RemoteDataSourceRepository repository;
  GetFoodDetails({@required this.repository});

  @override
  Future<Either<Failure, Food>> call(int foodId) async {
    return await repository.getFoodDetails(foodId);
  }
}
