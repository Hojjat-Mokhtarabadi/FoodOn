import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/usecases/usecase_base.dart';
import 'package:foodon/src/data/models/food/food.dart';
import 'package:foodon/src/domain/usecases/get_popular_foods.dart';
import 'package:foodon/src/domain/usecases/get_special_foods.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSpecialFoods getSpecialFoods;
  final GetPopularFoods getPopularFoods;

  HomeBloc({this.getSpecialFoods, this.getPopularFoods})
      : super(HomeInitial()) {
    add(GetHomePageFoods());
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetHomePageFoods) {
      yield HomePageFoodsLoading();
      final specialFoods = await getSpecialFoods.call(NoParams());
      final popularFoods = await getPopularFoods.call(NoParams());
      yield HomePageFoodsLoaded(
        specialfoodsList: specialFoods,
        popularfoodsList: popularFoods,
      );
    }
  }
}