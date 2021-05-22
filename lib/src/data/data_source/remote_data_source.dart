import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/exceptions.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/src/data/models/cart/order.dart';
import 'package:foodon/src/data/models/cart/orders_list.dart';
import 'package:foodon/src/data/models/category/categories_list.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest);
  Future<FoodsList> getPopularFoods();
  Future<FoodsList> getSpecialFoods();
  Future<Food> getFoodDetails(int foodId);
  Future<CategoriesList> getCategoriesList();
  Future<OrdersList> getOrdersList();
  Future<void> postNewOrder(Order order);
  Future<Customer> getUserAuthentication(User user);
  Future<PostSuccess> postNewUser(Customer customer);
  Future<PutSuccess> putUserInfo(Customer customer);
  Future<DeleteSuccess> deleteUser(int userId);
  Future<Customer> getUserInfo(int userId);
}

const kHeader = {
  "Accept": "application/json",
  "content-type": "application/json"
};

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String baseUrl;

  RemoteDataSourceImpl({
    @required this.client,
    @required this.baseUrl,
  });

  @override
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest) async {
    String path = "api/Categories/id";
    final Map<String, String> params = {"id": "${categoryRequest.id}"};
    return await _getSpecifiedFoodsList(path, params);
  }

  @override
  Future<FoodsList> getPopularFoods() async {
    String path = "/api/Foods/GetAllFoods";
    return await _getSpecifiedFoodsList(path, {});
  }

  @override
  Future<FoodsList> getSpecialFoods() async {
    String path = "/api/Foods/GetAllFoods";
    return await _getSpecifiedFoodsList(path, {});
  }

  Future<FoodsList> _getSpecifiedFoodsList(
      String path, Map<String, String> params) async {
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    print(result.statusCode);
    if (result.statusCode == 200) {
      return FoodsList.fromJson(result.body);
    } else if (result.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Food> getFoodDetails(int foodId) async {
    final String path = "api/Foods/id";
    final Map<String, String> params = {"id": "$foodId"};
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200) {
      return Food.fromJson(result.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoriesList> getCategoriesList() async {
    final String path = "/api/Categories/GetAllCategories";
    final result = await client.get(Uri.https(baseUrl, path));
    if (result.statusCode == 200) {
      return CategoriesList.fromJson(result.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<OrdersList> getOrdersList() async {
    final String path = "";
    final result = await client.get(Uri.https(baseUrl, path));
    if (result.statusCode == 200) {
      return OrdersList.fromJson(result.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> postNewOrder(Order order) async {
    final String path = "";
    final result = await client.post(Uri.https(baseUrl, path),
        body: order.toJson(), headers: kHeader);
    if (result.statusCode == 200) {
      //maybe it should be changed!?
      return result.body;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Customer> getUserAuthentication(User user) async {
    final String path = "api/Customer/GetAuthentication";
    final Map<String, String> params = {
      "phone": "${user.userName}",
      "pass": "${user.password}"
    };
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    print(Uri.https(baseUrl, path, params));
    if (result.statusCode == 200) {
      return Customer.fromJson(result.body);
    } else if (result.statusCode == 404) {
      throw AuthenticationFailedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostSuccess> postNewUser(Customer customer) async {
    final String path = "api/Customer/PostUser";
    final result = await client.post(Uri.https(baseUrl, path),
        body: customer.toJson(), headers: kHeader);
    if (result.statusCode == 200) {
      print('here remote');
      return PostSuccess();
    } else if (result.statusCode == 400) {
      throw AlreadyRegisteredException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PutSuccess> putUserInfo(Customer customer) async {
    final String path = "api/Customer/PutUser";
    final Map<String, String> params = {"id": "${customer.id}"};
    final result = await client.put(Uri.https(baseUrl, path, params),
        body: customer.toJson(), headers: kHeader);
    if (result.statusCode == 200) {
      return PutSuccess();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DeleteSuccess> deleteUser(int userId) async {
    final String path = "api/Customer/DeleteUserById";
    final Map<String, String> params = {"id": "$userId"};
    final result =
        await client.delete(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200) {
      return DeleteSuccess();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Customer> getUserInfo(int userId) async {
    final String path = "api/Customer/id";
    final Map<String, String> params = {"id": "$userId"};
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200) {
      return Customer.fromJson(result.body);
    } else {
      throw ServerException();
    }
  }
}
