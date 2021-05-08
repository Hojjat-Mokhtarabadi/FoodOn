part of 'food_details_bloc.dart';

@immutable
abstract class FoodDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFoodDetailsEvent extends FoodDetailsEvent {
  final foodId;
  GetFoodDetailsEvent({this.foodId});

  @override
  List<Object> get props => [foodId];
}
