import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/exceptions.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/bill/bills_list.dart';
import 'package:foodon/src/data/models/bill/ins_orders_list.dart';
import 'package:foodon/src/data/models/bill/orders_list.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/data/models/cart/cart_orders_list.dart';
import 'package:foodon/src/data/models/category/categories_list.dart';
import 'package:foodon/src/data/models/customer/authentication_response.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/data/models/food/comment_view_list.dart';
import 'package:foodon/src/data/models/food/food_view.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/data/models/food/score.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:foodon/src/domain/usecases/get_user_bills.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest);
  Future<FoodsList> getPopularFoods();
  Future<FoodsList> getSpecialFoods();
  Future<FoodView> getFoodDetails(FoodDetailsReqModel fdr);
  Future<CategoriesList> getCategoriesList();
  Future<CartOrdersList> getOrdersList(CartItemsModel cartItems);
  Future<PostSuccess> postNewOrder(CartOrder order);
  Future<DeleteSuccess> deleteCartOrder(CartOrder order);
  Future<DeleteSuccess> clearCart(ClearCartReqModel cartInfo);
  Future<PutSuccess> putCartOrder(CartOrder cartOrder);
  Future<AuthenticationResponse> getUserAuthentication(User user);
  Future<PostSuccess> postNewUser(Customer customer);
  Future<PutSuccess> putUserInfo(Customer customer);
  Future<DeleteSuccess> deleteUser(int userId);
  Future<Customer> getUserInfo(int userId);
  Future<PostSuccess> postNewComment(Comment comment);
  Future<PutSuccess> putComment(Comment comment);
  Future<PutSuccess> putScore(Score score);
  Future<PostSuccess> postNewScore(Score score);
  Future<CommentViewList> getCommentsScoresList(CommentsReqModel crm);
  Future<PostSuccess> postNewBill(Bill bill);
  Future<PostSuccess> postNewBillOrders(OrdersList billOrdersList);
  Future<BillsList> getUserBillsList(BillReqModel bill);
  Future<BillOrdersList> getBillDetail(BillReqModel bill);
}

const kHeader = {
  "Accept": "application/json",
  "content-type": "application/json"
};

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String baseUrl;
  //final Dio client;

  RemoteDataSourceImpl({
    @required this.client,
    @required this.baseUrl,
  });

  @override
  Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest) async {
    String path = "api/Categories/id";
    final Map<String, String> params = {"id": "${categoryRequest.id}"};
    return await _getSpecifiedList(path, params);
  }

  @override
  Future<FoodsList> getPopularFoods() async {
    String path = "/api/Foods/GetAllFoods";
    return await _getSpecifiedList(path, {});
  }

  @override
  Future<FoodsList> getSpecialFoods() async {
    String path = "/api/Foods/GetAllFoods";
    return await _getSpecifiedList(path, {});
  }

  Future<FoodsList> _getSpecifiedList(
      String path, Map<String, String> params) async {
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200)
      return FoodsList.fromJson(result.body);
    else if (result.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FoodView> getFoodDetails(FoodDetailsReqModel fdReq) async {
    final String path = "api/Foods/GetById";
    final Map<String, String> params = {
      "id": "${fdReq.foodId}",
      "customer_id": "${fdReq.userId}"
    };
    print(Uri.https(baseUrl, path, params));
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    print(Uri.https(baseUrl, path, params));
    print(result.body);
    if (result.statusCode == 200) return FoodView.fromJson(result.body);
    throw ServerException();
  }

  @override
  Future<CategoriesList> getCategoriesList() async {
    final String path = "/api/Categories/GetAllCategories";
    final result = await client.get(Uri.https(baseUrl, path), headers: kHeader);
    if (result.statusCode == 200) return CategoriesList.fromJson(result.body);
    throw ServerException();
  }

  @override
  Future<CartOrdersList> getOrdersList(CartItemsModel cartItems) async {
    final String path = "api/Cart/id";
    final Map<String, String> params = {"customerId": "${cartItems.userId}"};
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200)
      return CartOrdersList.fromJson(result.body);
    else if (result.statusCode == 404) throw NotFoundException();
    throw ServerException();
  }

  @override
  Future<PostSuccess> postNewOrder(CartOrder order) async {
    final String path = "api/Cart/PostCartItem";
    final result = await client.post(Uri.https(baseUrl, path),
        body: order.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PostSuccess();
    throw ServerException();
  }

  @override
  Future<DeleteSuccess> deleteCartOrder(CartOrder order) async {
    final String path = "api/Cart/DeleteCartOrder";
    final result = await client.delete(Uri.https(baseUrl, path),
        body: order.toJson(), headers: kHeader);
    if (result.statusCode == 200) return DeleteSuccess();
    throw ServerException();
  }

  @override
  Future<DeleteSuccess> clearCart(ClearCartReqModel cartInfo) async {
    final String path = "api/Cart/ClearCart";
    final Map<String, String> params = {
      "cartId": "${cartInfo.cartId}",
    };
    final result =
        await client.delete(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200) return DeleteSuccess();
    throw ServerException();
  }

  @override
  Future<AuthenticationResponse> getUserAuthentication(User user) async {
    final String path = "api/Customer/GetAuthentication";
    final Map<String, String> params = {
      "phone": "${user.userName}",
      "pass": "${user.password}"
    };
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    print(Uri.https(baseUrl, path, params));
    print(result.body);
    if (result.statusCode == 200)
      return AuthenticationResponse.fromJson(result.body);
    else if (result.statusCode == 404) throw AuthenticationFailedException();
    throw ServerException();
  }

  @override
  Future<PostSuccess> postNewUser(Customer customer) async {
    final String path = "api/Customer/PostUser";
    print(Uri.https(baseUrl, path));
    final result = await client.post(Uri.https(baseUrl, path),
        body: customer.toJson(), headers: kHeader);
    if (result.statusCode == 200)
      return PostSuccess(postedItemId: result.body);
    else if (result.statusCode == 400) throw AlreadyRegisteredException();
    throw ServerException();
  }

  @override
  Future<PutSuccess> putUserInfo(Customer customer) async {
    final String path = "api/Customer/PutUser";
    final Map<String, String> params = {"id": "${customer.id}"};
    final result = await client.put(Uri.https(baseUrl, path, params),
        body: customer.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PutSuccess();
    throw ServerException();
  }

  @override
  Future<DeleteSuccess> deleteUser(int userId) async {
    final String path = "api/Customer/DeleteUserById";
    final Map<String, String> params = {"id": "$userId"};
    final result =
        await client.delete(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200) return DeleteSuccess();
    throw ServerException();
  }

  @override
  Future<Customer> getUserInfo(int userId) async {
    final String path = "api/Customer/id";
    final Map<String, String> params = {"id": "$userId"};
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200) return Customer.fromJson(result.body);
    throw ServerException();
  }

  @override
  Future<PostSuccess> postNewComment(Comment comment) async {
    final String path = "api/Comment/AddComment";
    final result = await client.post(Uri.https(baseUrl, path),
        body: comment.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PostSuccess();
    throw ServerException();
  }

  @override
  Future<PutSuccess> putComment(Comment comment) async {
    final String path = "api/Comment/PutComment";
    final result = await client.put(Uri.https(baseUrl, path),
        body: comment.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PutSuccess();
    throw ServerException();
  }

  @override
  Future<PostSuccess> postNewScore(Score score) async {
    final String path = "api/Score/AddScore";
    final result = await client.post(Uri.https(baseUrl, path),
        body: score.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PostSuccess();
    throw ServerException();
  }

  @override
  Future<CommentViewList> getCommentsScoresList(CommentsReqModel crm) async {
    final String path = "api/Comment/CommentFoodList";
    final Map<String, String> params = {
      "food_id": "${crm.foodId}",
      "customer_id": "${crm.userId}"
    };
    print(Uri.https(baseUrl, path, params));
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200)
      return CommentViewList.fromJson(result.body);
    else if (result.statusCode == 404) {
      throw NotFoundException();
    } else {
      print('here in comments lis');
      throw ServerException();
    }
  }

  @override
  Future<PostSuccess> postNewBill(Bill bill) async {
    final String path = "api/Order/AddOrder";
    final result = await client.post(Uri.https(baseUrl, path),
        body: bill.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PostSuccess(postedItemId: result.body);
    throw ServerException();
  }

  @override
  Future<PostSuccess> postNewBillOrders(OrdersList billOrdersList) async {
    final String path = "api/Order_Food/AddOrderFood";
    final result = await client.post(Uri.https(baseUrl, path),
        body: billOrdersList.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PostSuccess();
    throw ServerException();
  }

  @override
  Future<BillsList> getUserBillsList(BillReqModel billReq) async {
    final String path = "api/Order/GetAllCustomerOrder";
    final Map<String, String> params = {"customer_id": "${billReq.userId}"};
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200)
      return BillsList.fromJson(result.body);
    else if (result.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<BillOrdersList> getBillDetail(BillReqModel billReq) async {
    final String path = "api/Order_Food/GetOrderFood";
    final Map<String, String> params = {"order_id": "${billReq.billId}"};
    final result =
        await client.get(Uri.https(baseUrl, path, params), headers: kHeader);
    if (result.statusCode == 200)
      return BillOrdersList.fromJson(result.body);
    else if (result.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PutSuccess> putCartOrder(CartOrder cartOrder) async {
    final String path = "api/Cart/PutCartOrder";
    final result = await client.put(Uri.https(baseUrl, path),
        body: cartOrder.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PutSuccess();
    throw ServerException();
  }

  @override
  Future<PutSuccess> putScore(Score score) async {
    final String path = "api/Score/PutScore";
    final result = await client.put(Uri.https(baseUrl, path),
        body: score.toJson(), headers: kHeader);
    if (result.statusCode == 200) return PutSuccess();
    throw ServerException();
  }

// @override
// Future<CommentList> getComments() async {
//   final String path = "api/Customer/PostUser";
//   final result = await client.get(Uri.https(baseUrl, path), headers: kHeader);
//   print(result.statusCode);
//   if (result.statusCode == 200) {
//     return CommentList.fromJson(result.body);
//   } else if (result.statusCode == 404) {
//     throw NotFoundException();
//   } else {
//     throw ServerException();
//   }
// }
//
// @override
// Future<ScoreList> getScores() async {
//   final String path = "api/Customer/PostUser";
//   final result = await client.get(Uri.https(baseUrl, path), headers: kHeader);
//   print(result.statusCode);
//   if (result.statusCode == 200) {
//     return ScoreList.fromJson(result.body);
//   } else if (result.statusCode == 404) {
//     throw NotFoundException();
//   } else {
//     throw ServerException();
//   }
// }
}
