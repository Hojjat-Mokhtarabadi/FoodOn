import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/exceptions.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';

class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;
  RemoteDataSourceRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkConnection,
  });

  @override
  Future<Either<Failure, List<Food>>> getFoodsByCategory(
      CategoryRequest params) async {
    return await _getSpecifiedFoodsList(
        () => remoteDataSource.getFoodByCategory(params));
  }

  @override
  Future<Either<Failure, List<Food>>> getPopularFoods() async {
    return await _getSpecifiedFoodsList(
        () => remoteDataSource.getPopularFoods());
  }

  @override
  Future<Either<Failure, List<Food>>> getSpecialFoods() async {
    return await _getSpecifiedFoodsList(
        () => remoteDataSource.getSpecialFoods());
  }

  Future<Either<Failure, List<Food>>> _getSpecifiedFoodsList(
      Future<FoodsList> Function() requestFunction) async {
    if (await networkConnection.isConnected) {
      try {
        final result = await requestFunction();
        return Right(result.foodsList.toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Food>> getFoodDetails(int foodId) async {
    if (await networkConnection.isConnected) {
      try {
        final result = await remoteDataSource.getFoodDetails(foodId);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
