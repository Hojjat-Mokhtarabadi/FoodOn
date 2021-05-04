import 'package:flutter/cupertino.dart';
import 'package:foodon/core/exception/exceptions.dart';
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
  Future<List<Food>> getFoodsByCategory(CategoryRequest params) async {
    return await _getSpecifiedFoodsList(
        () => remoteDataSource.getFoodByCategory(params));
  }

  @override
  Future<List<Food>> getPopularFoods() async {
    return await _getSpecifiedFoodsList(
        () => remoteDataSource.getPopularFoods());
  }

  @override
  Future<List<Food>> getSpecialFoods() async {
    return await _getSpecifiedFoodsList(
        () => remoteDataSource.getSpecialFoods());
  }

  Future<List<Food>> _getSpecifiedFoodsList(
      Future<FoodsList> Function() requestFunction) async {
    if (await networkConnection.isConnected) {
      try {
        final result = await requestFunction();
        return result.foodsList.toList();
      } on ServerException {
        throw ServerException();
      }
    }
  }
}
