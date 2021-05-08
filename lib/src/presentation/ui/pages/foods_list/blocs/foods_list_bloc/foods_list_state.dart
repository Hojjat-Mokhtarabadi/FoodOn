part of 'foods_list_bloc.dart';

@immutable
abstract class FoodsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class FoodsListInitial extends FoodsListState {}

class FoodsListLoading extends FoodsListState {}

class FoodsListLoaded extends FoodsListState {
  final List<Food> foodsList;
  FoodsListLoaded({this.foodsList});

  @override
  List<Object> get props => [foodsList];
}

class FoodsListError extends FoodsListState {}
