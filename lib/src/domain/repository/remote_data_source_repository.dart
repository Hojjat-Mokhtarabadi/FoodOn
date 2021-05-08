import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';

abstract class RemoteDataSourceRepository {
  //
  Future<Either<Failure, List<Food>>> getPopularFoods();
  Future<Either<Failure, List<Food>>> getSpecialFoods();
  Future<Either<Failure, List<Food>>> getFoodsByCategory(
      CategoryRequest params);
  Future<Either<Failure, Food>> getFoodDetails(int foodId);
}
