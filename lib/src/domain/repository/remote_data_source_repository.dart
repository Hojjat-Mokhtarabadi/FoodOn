import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';

abstract class RemoteDataSourceRepository {
  //
  Future<List<Food>> getPopularFoods();

  Future<List<Food>> getSpecialFoods();

  Future<List<Food>> getFoodsByCategory(CategoryRequest params);
}
