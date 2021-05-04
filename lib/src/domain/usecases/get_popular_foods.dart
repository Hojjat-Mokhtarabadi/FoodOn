import 'package:flutter/cupertino.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/data/models/food/foods_list.dart';
import 'package:foodon/src/domain/repository/remote_data_source_repository.dart';

class GetPopularFoods extends UsecaseBase<List<Food>, NoParams> {
  final RemoteDataSourceRepository repository;
  GetPopularFoods({@required this.repository});

  @override
  Future<List<Food>> call(NoParams params) async {
    return await repository.getPopularFoods();
  }
}
