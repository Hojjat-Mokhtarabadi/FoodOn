part of 'food_details_bloc.dart';

@immutable
abstract class FoodDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class FoodDetailsInitial extends FoodDetailsState {}

class FoodDetailsLoading extends FoodDetailsState {}

class FoodDetailsLoaded extends FoodDetailsState {
  final FoodView food;
  FoodDetailsLoaded({this.food});

  @override
  List<Object> get props => [food];
}

class FoodDetailsError extends FoodDetailsState {
  final String msg;
  FoodDetailsError({this.msg});

  @override
  List<Object> get props => [msg];
}
