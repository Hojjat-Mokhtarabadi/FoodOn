import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/exceptions.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/src/data/data_source/firebase_storage.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/models/bill/bill.dart';
import 'package:foodon/src/data/models/bill/ins_orders_list.dart';
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
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';
import 'package:foodon/src/domain/usecases/clear_cart.dart';
import 'package:foodon/src/domain/usecases/get_comments_scores_list.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_orders_list.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';
import 'package:foodon/src/domain/usecases/get_user_bills.dart';

class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;
  final FirebaseStorageApi firebaseStorageApi;

  RemoteDataSourceRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.networkConnection,
      @required this.firebaseStorageApi});

  @override
  Future<Either<Failure, List<Food>>> getFoodsByCategory(
      CategoryRequest params) async {
    return await _tryRequest<List<Food>>(() async {
      final result = await remoteDataSource.getFoodByCategory(params);
      return result.foodsList.toList();
    });
  }

  @override
  Future<Either<Failure, List<Food>>> getPopularFoods() async {
    return await _tryRequest<List<Food>>(() async {
      final result = await remoteDataSource.getPopularFoods();
      return result.foodsList.toList();
    });
  }

  @override
  Future<Either<Failure, List<Food>>> getSpecialFoods() async {
    return await _tryRequest<List<Food>>(() async {
      final result = await remoteDataSource.getSpecialFoods();
      return result.foodsList.toList();
    });
  }

  @override
  Future<Either<Failure, FoodView>> getFoodDetails(
      FoodDetailsReqModel fdr) async {
    return await _tryRequest<FoodView>(() async {
      final result = await remoteDataSource.getFoodDetails(fdr);
      return result;
    });
  }

  @override
  Future<Either<Failure, List<ct.Category>>> getCategoriesList() async {
    return await _tryRequest<List<ct.Category>>(() async {
      final result = await remoteDataSource.getCategoriesList();
      return result.categoriesList.toList();
    });
  }

  @override
  Future<Either<Failure, List<CartOrdersView>>> getOrdersList(
      CartItemsModel cartItems) async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.getOrdersList(cartItems);
      return result.cartItemsList.toList();
    });
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewOrder(CartOrder order) async {
    return await _tryRequest(() async {
      return await remoteDataSource.postNewOrder(order);
    });
  }

  @override
  Future<Either<Failure, PutSuccess>> putCartOrder(CartOrder cartOrder) async {
    return await _tryRequest<PutSuccess>(() async {
      return await remoteDataSource.putCartOrder(cartOrder);
    });
  }

  @override
  Future<Either<Failure, DeleteSuccess>> deleteCartOrder(
      CartOrder order) async {
    return await _tryRequest(() async {
      return await remoteDataSource.deleteCartOrder(order);
    });
  }

  @override
  Future<Either<Failure, DeleteSuccess>> clearCart(
      ClearCartReqModel cartInfo) async {
    return await _tryRequest(() async {
      return await remoteDataSource.clearCart(cartInfo);
    });
  }

  @override
  Future<Either<Failure, AuthenticationPair<Customer, int>>>
      getUserAuthentication(User user) async {
    if (await networkConnection.isConnected) {
      print('connected');
      try {
        final result = await remoteDataSource.getUserAuthentication(user);
        return Right(AuthenticationPair(
            userInfo: result.userInfo, cartId: result.cartId));
      } on ServerException {
        return Left(ServerFailure());
      } on AuthenticationFailedException {
        return Left(AuthenticationFailed());
      }
    } else {
      print('not connect');
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewUser(Customer customer) async {
    return await _tryRequest<PostSuccess>(() async {
      final result = await remoteDataSource.postNewUser(customer);
      print('here repo');
      print(result);
      return result;
    });
  }

  @override
  Future<Either<Failure, PutSuccess>> putUserInfo(Customer customer) async {
    return await _tryRequest<PutSuccess>(() async {
      return await remoteDataSource.putUserInfo(customer);
    });
  }

  @override
  Future<Either<Failure, DeleteSuccess>> deleteUser(int userId) async {
    return await _tryRequest<DeleteSuccess>(() async {
      return await remoteDataSource.deleteUser(userId);
    });
  }

  @override
  Future<Either<Failure, Customer>> getUserInfo(int userId) async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.getUserInfo(userId);
      return result;
    });
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewComment(Comment comment) async {
    return await _tryRequest<PostSuccess>(() async {
      return await remoteDataSource.postNewComment(comment);
    });
  }

  @override
  Future<Either<Failure, PutSuccess>> putComment(Comment comment) async {
    return await _tryRequest<PutSuccess>(() async {
      return await remoteDataSource.putComment(comment);
    });
  }

  @override
  Future<Either<Failure, PutSuccess>> putScore(Score score) async {
    return await _tryRequest<PutSuccess>(() async {
      return await remoteDataSource.putScore(score);
    });
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewScore(Score score) async {
    return await _tryRequest<PostSuccess>(() async {
      return await remoteDataSource.postNewScore(score);
    });
  }

  @override
  Future<Either<Failure, CommentsListModel>> getCommentsScoresList(
      CommentsReqModel crm) async {
    return await _tryRequest<CommentsListModel>(() async {
      final result = await remoteDataSource.getCommentsScoresList(crm);
      return CommentsListModel(
          commentsList: result.commentsList.toList(),
          alreadyCommented: result.alreadyCommented,
          commentId: result.commentId);
    });
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewBill(Bill bill) async {
    return await _tryRequest<PostSuccess>(() async {
      return await remoteDataSource.postNewBill(bill);
    });
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewBillOrders(
      List<BillOrder> billOrdersList) async {
    return await _tryRequest<PostSuccess>(() async {
      var mappedList = ListBuilder<BillOrder>(billOrdersList);
      var ordersList = OrdersList((c) => c.ordersList = mappedList);
      var a = await remoteDataSource.postNewBillOrders(ordersList);
      print('repo succ');
      return a;
    });
  }

  @override
  Future<Either<Failure, List<Bill>>> getUserBills(BillReqModel bill) async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.getUserBillsList(bill);
      return result.billsList.toList();
    });
  }

  @override
  Future<Either<Failure, BillDetailsModel>> getBillDetails(
      BillReqModel bill) async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.getBillDetail(bill);
      return BillDetailsModel(
          ordersList: result.ordersList.toList(),
          orderId: result.orderId,
          orderDate: result.orderDate,
          totalPrice: result.totalPrice);
    });
  }

  Future<Either<Failure, T>> _tryRequest<T>(
      Future<T> Function() requestFunction) async {
    if (await networkConnection.isConnected) {
      try {
        final result = await requestFunction();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on NotFoundException {
        return Left(NotFoundFailure());
      } on AlreadyRegisteredException {
        return Left(AlreadyRegisteredFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Score>>> getScores() {
    // TODO: implement getScores
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Score>> getUserScore(Score scoreIdsInfo) {
    // TODO: implement getUserScore
    throw UnimplementedError();
  }

  @override
  Future<List<FirebaseFileModel>> getFoodImages(String path) async {
    return await firebaseStorageApi.getFoodImages(path);
  }

  @override
  Future<List<FirebaseFileModel>> getFoodImagesById(
      String path, List<int> ids) async {
    return await firebaseStorageApi.getFoodImagesById(path, ids);
  }
}
