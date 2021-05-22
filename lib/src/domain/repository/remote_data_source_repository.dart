import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/src/data/models/cart/order.dart' as order;
import 'package:foodon/src/data/models/category/category.dart' as ct;
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';

abstract class RemoteDataSourceRepository {
  //
  Future<Either<Failure, List<Food>>> getPopularFoods();
  Future<Either<Failure, List<Food>>> getSpecialFoods();
  Future<Either<Failure, List<Food>>> getFoodsByCategory(
      CategoryRequest params);
  Future<Either<Failure, Food>> getFoodDetails(int foodId);
  Future<Either<Failure, List<ct.Category>>> getCategoriesList();
  Future<Either<Failure, List<order.Order>>> getOrdersList();
  Future<Either<Failure, void>> postNewOrder(order.Order order);
  Future<Either<Failure, Customer>> getUserAuthentication(User user);
  Future<Either<Failure, PostSuccess>> postNewUser(Customer customer);
  Future<Either<Failure, PutSuccess>> putUserInfo(Customer customer);
  Future<Either<Failure, DeleteSuccess>> deleteUser(int userId);
  Future<Either<Failure, Customer>> getUserInfo(int userId);
}
