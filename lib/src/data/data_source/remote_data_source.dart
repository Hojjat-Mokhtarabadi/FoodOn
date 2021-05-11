import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/exceptions.dart';
import 'package:foodon/src/data/models/category/categories_list.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest);
  Future<FoodsList> getPopularFoods();
  Future<FoodsList> getSpecialFoods();
  Future<Food> getFoodDetails(int foodId);
  Future<CategoriesList> getCategoriesList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String baseUrl;

  RemoteDataSourceImpl({
    @required this.client,
    @required this.baseUrl,
  });

  @override
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest) async {
    String path = '';
    return await _getSpecifiedFoodsList(path);
  }

  @override
  Future<FoodsList> getPopularFoods() async {
    String path = "/api/Foods";
    return await _getSpecifiedFoodsList(path);
  }

  @override
  Future<FoodsList> getSpecialFoods() async {
    String path = "/api/Foods";
    return await _getSpecifiedFoodsList(path);
  }

  Future<FoodsList> _getSpecifiedFoodsList(String path) async {
    print(Uri.https(baseUrl, "/api/Foods"));
    final result = await client.get(Uri.https(baseUrl, path),
        headers: {'Content-Type': 'application/json'});
    print(result.statusCode);
    if (result.statusCode == 200) {
      return FoodsList.fromJson(result.body);
    } else {
      print('here');
      throw ServerException();
    }
  }

  @override
  Future<Food> getFoodDetails(int foodId) async {
    final String path = '';
    final result = await client.get(Uri.https(baseUrl, path));
    if (result.statusCode == 200) {
      return Food.fromJson(result.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoriesList> getCategoriesList() async {
    final String path = "/api/Categories";
    final result = await client.get(Uri.https(baseUrl, path));
    if (result.statusCode == 200) {
      return CategoriesList.fromJson(result.body);
    } else {
      throw ServerException();
    }
  }
}
