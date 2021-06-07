// @override
// Future<FoodsList> getFoodByCategory(CategoryRequest categoryRequest) async {
//   String path = "api/Categories/id";
//   final Map<String, String> params = {"id": "${categoryRequest.id}"};
//   return await _getSpecifiedList(path, params);
// }
//
// @override
// Future<FoodsList> getPopularFoods() async {
//   String path = "/api/Foods/GetAllFoods";
//   return await _getSpecifiedList(path, {});
// }
//
// @override
// Future<FoodsList> getSpecialFoods() async {
//   String path = "/api/Foods/GetAllFoods";
//   return await _getSpecifiedList(path, {});
// }
//
// Future<FoodsList> _getSpecifiedList(
//     String path, Map<String, String> params) async {
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return FoodsList.fromJson(result.data);
//   } on DioError catch (e) {
//     if (e.response.statusCode == 404) {
//       throw NotFoundException();
//     } else {
//       throw ServerException();
//     }
//   }
// }
//
// @override
// Future<FoodView> getFoodDetails(FoodDetailsReqModel fdReq) async {
//   final String path = "api/Foods/GetById";
//   final Map<String, String> params = {
//     "id": "${fdReq.foodId}",
//     "customer_id": "${fdReq.userId}"
//   };
//   try {
//     print(Uri.https(baseUrl, path, params));
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return FoodView.fromJson(result.data);
//   } on DioError catch (e) {
//     print(e);
//     throw ServerException();
//   }
// }
//
// @override
// Future<CategoriesList> getCategoriesList() async {
//   final String path = "/api/Categories/GetAllCategories";
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path));
//     return CategoriesList.fromJson(result.data);
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<CartOrdersList> getOrdersList(CartItemsModel cartItems) async {
//   final String path = "api/Cart/id";
//   final Map<String, String> params = {"customerId": "${cartItems.userId}"};
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return CartOrdersList.fromJson(result.data);
//   } on DioError catch (e) {
//     if (e.response.statusCode == 404) {
//       throw NotFoundException();
//     }
//     throw ServerException();
//   }
// }
//
// @override
// Future<PostSuccess> postNewOrder(CartOrder order) async {
//   final String path = "api/Cart/PostCartItem";
//   try {
//     final result =
//     await client.postUri(Uri.https(baseUrl, path), data: order.toJson());
//     return PostSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<DeleteSuccess> deleteCartOrder(CartOrder order) async {
//   final String path = "api/Cart/DeleteCartOrder";
//   try {
//     final result = await client.deleteUri(Uri.https(baseUrl, path),
//         data: order.toJson());
//     return DeleteSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<DeleteSuccess> clearCart(ClearCartReqModel cartInfo) async {
//   final String path = "api/Cart/ClearCart";
//   final Map<String, String> params = {
//     "cartId": "${cartInfo.cartId}",
//   };
//   try {
//     final result = await client.deleteUri(Uri.https(baseUrl, path, params));
//     return DeleteSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<AuthenticationResponse> getUserAuthentication(User user) async {
//   final String path = "api/Customer/GetAuthentication";
//   final Map<String, String> params = {
//     "phone": "${user.userName}",
//     "pass": "${user.password}"
//   };
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     print(Uri.https(baseUrl, path, params));
//     print(result.data);
//     return AuthenticationResponse.fromJson(result.data);
//   } on DioError catch (e) {
//     if (e.response.statusCode == 404) {
//       throw AuthenticationFailedException();
//     } else {
//       throw ServerException();
//     }
//   }
// }
//
// @override
// Future<PostSuccess> postNewUser(Customer customer) async {
//   final String path = "api/Customer/PostUser";
//   try {
//     final result = await client.postUri(Uri.https(baseUrl, path),
//         data: customer.toJson());
//
//     return PostSuccess(postedItemId: result.data);
//   } on DioError catch (e) {
//     if (e.response.statusCode == 400) {
//       throw AlreadyRegisteredException();
//     } else {
//       throw ServerException();
//     }
//   }
// }
//
// @override
// Future<PutSuccess> putUserInfo(Customer customer) async {
//   final String path = "api/Customer/PutUser";
//   final Map<String, String> params = {"id": "${customer.id}"};
//   try {
//     final result = await client.putUri(Uri.https(baseUrl, path, params),
//         data: customer.toJson());
//     return PutSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<DeleteSuccess> deleteUser(int userId) async {
//   final String path = "api/Customer/DeleteUserById";
//   final Map<String, String> params = {"id": "$userId"};
//   try {
//     final result = await client.deleteUri(Uri.https(baseUrl, path, params));
//     return DeleteSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<Customer> getUserInfo(int userId) async {
//   final String path = "api/Customer/id";
//   final Map<String, String> params = {"id": "$userId"};
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return Customer.fromJson(result.data);
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<PostSuccess> postNewComment(Comment comment) async {
//   final String path = "api/Comment/AddComment";
//   try {
//     final result = await client.postUri(Uri.https(baseUrl, path),
//         data: comment.toJson());
//     return PostSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<PutSuccess> putComment(Comment comment) async {
//   final String path = "api/Comment/PutComment";
//   try {
//     final result =
//     await client.putUri(Uri.https(baseUrl, path), data: comment.toJson());
//     return PutSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<PostSuccess> postNewScore(Score score) async {
//   final String path = "api/Score/AddScore";
//   try {
//     final result =
//     await client.postUri(Uri.https(baseUrl, path), data: score.toJson());
//     return PostSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<CommentViewList> getCommentsScoresList(CommentsReqModel crm) async {
//   final String path = "api/Comment/CommentFoodList";
//   final Map<String, String> params = {
//     "food_id": "${crm.foodId}",
//     "customer_id": "${crm.userId}"
//   };
//   try {
//     print(Uri.https(baseUrl, path, params));
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return CommentViewList.fromJson(result.data);
//   } on DioError catch (e) {
//     print('in cathc');
//     if (e.response.statusCode == 404) {
//       throw NotFoundException();
//     } else {
//       print('here in comments lis');
//       throw ServerException();
//     }
//   }
// }
//
// @override
// Future<PostSuccess> postNewBill(Bill bill) async {
//   final String path = "api/Order/AddOrder";
//   try {
//     final result =
//     await client.postUri(Uri.https(baseUrl, path), data: bill.toJson());
//     return PostSuccess(postedItemId: result.data);
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<PostSuccess> postNewBillOrders(OrdersList billOrdersList) async {
//   final String path = "api/Order_Food/AddOrderFood";
//   try {
//     final result = await client.postUri(Uri.https(baseUrl, path),
//         data: billOrdersList.toJson());
//     print('remote succ');
//     return PostSuccess();
//   } on DioError catch (e) {
//     print('remote fail');
//     throw ServerException();
//   }
// }
//
// @override
// Future<BillsList> getUserBillsList(BillReqModel billReq) async {
//   final String path = "api/Order/GetAllCustomerOrder";
//   final Map<String, String> params = {"customer_id": "${billReq.userId}"};
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return BillsList.fromJson(result.data);
//   } on DioError catch (e) {
//     print(e);
//     if (e.response.statusCode == 404) {
//       throw NotFoundException();
//     } else {
//       throw ServerException();
//     }
//   }
// }
//
// @override
// Future<BillOrdersList> getBillDetail(BillReqModel billReq) async {
//   final String path = "api/Order_Food/GetOrderFood";
//   final Map<String, String> params = {"order_id": "${billReq.billId}"};
//   try {
//     final result = await client.getUri(Uri.https(baseUrl, path, params));
//     return BillOrdersList.fromJson(result.data);
//   } on DioError catch (e) {
//     if (e.response.statusCode == 404) {
//       throw NotFoundException();
//     } else {
//       throw ServerException();
//     }
//   }
// }
//
// @override
// Future<PutSuccess> putCartOrder(CartOrder cartOrder) async {
//   final String path = "api/Cart/PutCartOrder";
//   try {
//     final result = await client.putUri(Uri.https(baseUrl, path),
//         data: cartOrder.toJson());
//     return PutSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
//
// @override
// Future<PutSuccess> putScore(Score score) async {
//   final String path = "api/Score/PutScore";
//   try {
//     final result =
//     await client.putUri(Uri.https(baseUrl, path), data: score.toJson());
//     return PutSuccess();
//   } on DioError catch (e) {
//     throw ServerException();
//   }
// }
