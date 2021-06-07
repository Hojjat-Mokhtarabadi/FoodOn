part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Food> specialFoodsList;
  final List<Food> popularFoodsList;
  final List<Category> categoriesList;

  HomeLoaded(
      {this.specialFoodsList, this.popularFoodsList, this.categoriesList});

  @override
  List<Object> get props => [specialFoodsList, popularFoodsList];
}

class HomeError extends HomeState {
  final String message;
  HomeError({@required this.message});

  @override
  List<Object> get props => [message];
}
