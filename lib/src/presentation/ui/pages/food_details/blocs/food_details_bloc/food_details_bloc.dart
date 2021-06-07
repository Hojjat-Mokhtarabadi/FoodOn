import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodon/core/errors/failures.dart';
import 'package:foodon/src/data/models/food/food_view.dart';
import 'package:foodon/src/domain/usecases/get_food_details.dart';
import 'package:meta/meta.dart';

import '../../../../../../../constants.dart';

part 'food_details_event.dart';
part 'food_details_state.dart';

class FoodDetailsBloc extends Bloc<FoodDetailsEvent, FoodDetailsState> {
  final GetFoodDetails getFoodDetails;
  FoodDetailsBloc({
    @required this.getFoodDetails,
  }) : super(FoodDetailsInitial());

  @override
  Stream<FoodDetailsState> mapEventToState(
    FoodDetailsEvent event,
  ) async* {
    if (event is GetFoodDetailsEvent) {
      yield FoodDetailsLoading();
      final result = await getFoodDetails.call(event.fdReq);
      yield* result.fold(
        (failure) async* {
          if (failure is ServerFailure) {
            yield FoodDetailsError(msg: kServerErrorMsg);
          } else {
            yield FoodDetailsError(msg: kNoConnectionMsg);
          }
        },
        (success) async* {
          yield FoodDetailsLoaded(food: success);
        },
      );
    }
  }
}
