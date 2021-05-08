part of 'foods_list_bloc.dart';

@immutable
abstract class FoodsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFoodsListByCategoryEvent extends FoodsListEvent {
  final int categoryId;
  GetFoodsListByCategoryEvent({this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class GetPopularFoodsListEvent extends FoodsListEvent {}

class GetSpecialFoodsListEvent extends FoodsListEvent {}
