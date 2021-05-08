import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetFoodsByCategory extends UsecaseBase<List<Food>, CategoryRequest> {
  final RemoteDataSourceRepository repository;
  GetFoodsByCategory({@required this.repository});

  @override
  Future<Either<Failure, List<Food>>> call(CategoryRequest params) async {
    return await repository.getFoodsByCategory(params);
  }
}

class CategoryRequest extends Equatable {
  final int id;
  CategoryRequest({@required this.id});

  @override
  List<Object> get props => [id];
}
