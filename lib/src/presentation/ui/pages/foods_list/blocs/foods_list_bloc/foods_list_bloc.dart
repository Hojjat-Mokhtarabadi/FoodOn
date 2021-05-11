import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/usecases/get_foods_by_category.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'foods_list_event.dart';
part 'foods_list_state.dart';

class FoodsListBloc extends Bloc<FoodsListEvent, FoodsListState> {
  final GetFoodsByCategory getFoodsByCategory;
  final GetSpecialFoods getSpecialFoods;
  final GetPopularFoods getPopularFoods;
  FoodsListBloc({
    @required this.getFoodsByCategory,
    @required this.getSpecialFoods,
    @required this.getPopularFoods,
  }) : super(FoodsListInitial());

  @override
  Stream<FoodsListState> mapEventToState(
    FoodsListEvent event,
  ) async* {
    if (event is GetFoodsListByCategoryEvent) {
      yield* _getSpecifiedFoodsList(
          () => getFoodsByCategory.call(CategoryRequest(id: event.categoryId)));
    } else if (event is GetSpecialFoodsListEvent) {
      yield* _getSpecifiedFoodsList(() => getSpecialFoods.call(NoParams()));
    } else if (event is GetPopularFoodsListEvent) {
      yield* _getSpecifiedFoodsList(() => getPopularFoods.call(NoParams()));
    }
  }

  Stream<FoodsListState> _getSpecifiedFoodsList(
      Future<Either<Failure, List<Food>>> Function() callFunction) async* {
    yield FoodsListLoading();
    final result = await callFunction();
    yield* result.fold(
      (failure) async* {
        if (failure is ServerFailure) {
          yield FoodsListError(message: kServerErrorMsg);
        } else {
          yield FoodsListError(message: kNoConnectionMsg);
        }
      },
      (success) async* {
        yield FoodsListLoaded(foodsList: success);
      },
    );
  }
}
