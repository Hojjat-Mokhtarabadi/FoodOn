part of 'food_details_bloc.dart';

@immutable
abstract class FoodDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFoodDetailsEvent extends FoodDetailsEvent {
  final FoodDetailsReqModel fdReq;
  GetFoodDetailsEvent({this.fdReq});

  @override
  List<Object> get props => [fdReq];
}
