import 'package:dartz/dartz.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/bill/order.dart';
import 'package:foodon/src/data/models/cart/cart_order.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';
import 'package:foodon/src/data/models/category/category.dart' as ct;
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/comment.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/food_view.dart';
import 'package:foodon/src/data/models/food/score.dart';
import 'package:foodon/src/domain/entity/entity.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:foodon/src/domain/usecases/get_user_bills.dart';

abstract class RemoteDataSourceRepository {
  /// Home
  Future<Either<Failure, List<Food>>> getPopularFoods();
  Future<Either<Failure, List<Food>>> getSpecialFoods();
  Future<Either<Failure, List<ct.Category>>> getCategoriesList();
  Future<Either<Failure, List<Food>>> getFoodsByCategory(
      CategoryRequest params);

  /// FoodDetails
  Future<Either<Failure, FoodView>> getFoodDetails(FoodDetailsReqModel fdr);

  /// Cart
  Future<Either<Failure, List<CartOrdersView>>> getOrdersList(
      CartItemsModel cartItems);
  Future<Either<Failure, PostSuccess>> postNewOrder(CartOrder order);
  Future<Either<Failure, DeleteSuccess>> deleteCartOrder(CartOrder order);
  Future<Either<Failure, DeleteSuccess>> clearCart(ClearCartReqModel cartInfo);
  Future<Either<Failure, PutSuccess>> putCartOrder(CartOrder cartOrder);

  /// Bill
  Future<Either<Failure, PostSuccess>> postNewBill(Bill bill);
  Future<Either<Failure, PostSuccess>> postNewBillOrders(
      List<BillOrder> billOrdersList);
  Future<Either<Failure, List<Bill>>> getUserBills(BillReqModel billReq);
  Future<Either<Failure, BillDetailsModel>> getBillDetails(
      BillReqModel billReq);

  /// User
  Future<Either<Failure, AuthenticationPair<Customer, int>>>
      getUserAuthentication(User user);
  Future<Either<Failure, PostSuccess>> postNewUser(Customer customer);
  Future<Either<Failure, PutSuccess>> putUserInfo(Customer customer);
  Future<Either<Failure, DeleteSuccess>> deleteUser(int userId);
  Future<Either<Failure, Customer>> getUserInfo(int userId);

  /// Comment Score
  Future<Either<Failure, PostSuccess>> postNewComment(Comment comment);
  Future<Either<Failure, PostSuccess>> postNewScore(Score score);
  Future<Either<Failure, CommentsListModel>> getCommentsScoresList(
    CommentsReqModel crm,
  );
  Future<Either<Failure, PutSuccess>> putComment(Comment comment);
  Future<Either<Failure, PutSuccess>> putScore(Score score);
  Future<Either<Failure, List<Score>>> getScores();
  Future<Either<Failure, Score>> getUserScore(Score scoreIdsInfo);

  /// Firebase Storage
  Future<List<FirebaseFileModel>> getFoodImages(String path);
  Future<List<FirebaseFileModel>> getFoodImagesById(String path, List<int> id);
}
