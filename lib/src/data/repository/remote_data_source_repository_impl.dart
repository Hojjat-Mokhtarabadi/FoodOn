import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/exceptions.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/network_connection/network_connection.dart';
import 'package:foodon/core/success/success.dart';
import 'package:foodon/src/data/data_source/remote_data_source.dart';
import 'package:foodon/src/data/models/cart/order.dart' as order;
import 'package:foodon/src/data/models/category/category.dart' as ct;
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_user_authentication.dart';

class RemoteDataSourceRepositoryImpl implements RemoteDataSourceRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;

  RemoteDataSourceRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkConnection,
  });

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
  Future<Either<Failure, Food>> getFoodDetails(int foodId) async {
    return await _tryRequest<Food>(() async {
      final result = await remoteDataSource.getFoodDetails(foodId);
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
  Future<Either<Failure, List<order.Order>>> getOrdersList() async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.getOrdersList();
      return result.ordersList.toList();
    });
  }

  @override
  Future<Either<Failure, void>> postNewOrder(order.Order order) async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.postNewOrder(order);
      return result;
    });
  }

  @override
  Future<Either<Failure, Customer>> getUserAuthentication(User user) async {
    if (await networkConnection.isConnected) {
      try {
        final result = await remoteDataSource.getUserAuthentication(user);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on AuthenticationFailedException {
        return Left(AuthenticationFailed());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, PostSuccess>> postNewUser(Customer customer) async {
    return await _tryRequest<PostSuccess>(() async {
      final result = await remoteDataSource.postNewUser(customer);
      print('here repo');
      return PostSuccess();
    });
  }

  @override
  Future<Either<Failure, PutSuccess>> putUserInfo(Customer customer) async {
    return await _tryRequest<PutSuccess>(() async {
      final result = await remoteDataSource.putUserInfo(customer);
      return PutSuccess();
    });
  }

  @override
  Future<Either<Failure, DeleteSuccess>> deleteUser(int userId) async {
    return await _tryRequest<DeleteSuccess>(() async {
      final result = await remoteDataSource.deleteUser(userId);
      return DeleteSuccess();
    });
  }

  @override
  Future<Either<Failure, Customer>> getUserInfo(int userId) async {
    return await _tryRequest(() async {
      final result = await remoteDataSource.getUserInfo(userId);
      return result;
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
}
