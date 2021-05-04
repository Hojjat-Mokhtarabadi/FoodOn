import 'package:flutter/cupertino.dart';
import 'package:foodon/core/exception/exceptions.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest);
  Future<FoodsList> getPopularFoods();
  Future<FoodsList> getSpecialFoods();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String baseUrl;

  RemoteDataSourceImpl({@required this.client, this.baseUrl});

  @override
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest) async {
    String path = '';
    return await _getSpecifiedFoodsList(path);
  }

  @override
  Future<FoodsList> getPopularFoods() async {
    String path = '';
    return await _getSpecifiedFoodsList(path);
  }

  @override
  Future<FoodsList> getSpecialFoods() async {
    String path = '';
    return await _getSpecifiedFoodsList(path);
  }

  Future<FoodsList> _getSpecifiedFoodsList(String path) async {
    try {
      final result = await client.get(Uri.https(baseUrl, path));
      if (result.statusCode == 200) {
        return FoodsList.fromJson(result.body);
      } else {
        throw ServerException();
      }
    } finally {
      client.close();
    }
  }
}
