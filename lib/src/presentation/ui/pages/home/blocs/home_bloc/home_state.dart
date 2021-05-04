part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomePageFoodsLoading extends HomeState {}

class HomePageFoodsLoaded extends HomeState {
  final List<Food> specialfoodsList;
  final List<Food> popularfoodsList;

  HomePageFoodsLoaded({
    this.specialfoodsList,
    this.popularfoodsList,
  });

  @override
  List<Object> get props => [specialfoodsList, popularfoodsList];
}

class HomePageFoodsError extends HomeState {}
