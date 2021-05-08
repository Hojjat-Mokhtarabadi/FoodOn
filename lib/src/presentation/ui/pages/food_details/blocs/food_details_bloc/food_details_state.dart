part of 'food_details_bloc.dart';

@immutable
abstract class FoodDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class FoodDetailsInitial extends FoodDetailsState {}

class FoodDetailsLoading extends FoodDetailsState {}

class FoodDetailsLoaded extends FoodDetailsState {
  final Food food;
  FoodDetailsLoaded({this.food});

  @override
  List<Object> get props => [food];
}

class FoodDetailsError extends FoodDetailsState {}
