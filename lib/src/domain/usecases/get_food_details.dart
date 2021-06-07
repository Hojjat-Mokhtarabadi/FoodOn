import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food_view.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetFoodDetails extends UsecaseBase<FoodView, FoodDetailsReqModel> {
  final RemoteDataSourceRepository repository;
  GetFoodDetails({@required this.repository});

  @override
  Future<Either<Failure, FoodView>> call(FoodDetailsReqModel fdr) async {
    return await repository.getFoodDetails(fdr);
  }
}

class FoodDetailsReqModel extends Equatable {
  final int foodId;
  final int userId;
  FoodDetailsReqModel({this.foodId, this.userId});

  @override
  List<Object> get props => [foodId, userId];
}
