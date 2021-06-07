import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/constants.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/category/category.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/usecases/get_categories_list.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSpecialFoods getSpecialFoods;
  final GetPopularFoods getPopularFoods;
  final GetCategoriesList getCategoriesList;

  HomeBloc({
    @required this.getSpecialFoods,
    @required this.getPopularFoods,
    @required this.getCategoriesList,
  }) : super(HomeInitial()) {
    add(GetHomeItemsEvent());
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetHomeItemsEvent) {
      yield HomeLoading();
      final categories = await getCategoriesList.call(NoParams());
      yield* categories.fold(
        (failure) async* {
          if (failure is ServerFailure) {
            yield HomeError(message: kServerErrorMsg);
          } else {
            yield HomeError(message: kNoConnectionMsg);
          }
        },
        (categories) async* {
          final specialFoods = await getSpecialFoods.call(NoParams());
          yield* specialFoods.fold(
            (failure) async* {
              if (failure is ServerFailure) {
                yield HomeError(message: kServerErrorMsg);
              } else {
                yield HomeError(message: kNoConnectionMsg);
              }
            },
            (specialFoods) async* {
              yield HomeLoaded(
                  specialFoodsList: specialFoods,
                  popularFoodsList: specialFoods,
                  categoriesList: categories);
            },
          );
        },
      );
    }
  }
}
