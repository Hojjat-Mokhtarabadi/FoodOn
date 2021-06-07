// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AuthenticationResponse.serializer)
      ..add(Bill.serializer)
      ..add(BillOrder.serializer)
      ..add(BillOrdersList.serializer)
      ..add(BillsList.serializer)
      ..add(CartOrder.serializer)
      ..add(CartOrdersList.serializer)
      ..add(CartOrdersView.serializer)
      ..add(CategoriesList.serializer)
      ..add(Category.serializer)
      ..add(Comment.serializer)
      ..add(CommentView.serializer)
      ..add(CommentViewList.serializer)
      ..add(Customer.serializer)
      ..add(Delivery.serializer)
      ..add(Food.serializer)
      ..add(FoodView.serializer)
      ..add(FoodsList.serializer)
      ..add(OrdersList.serializer)
      ..add(Score.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Bill)]),
          () => new ListBuilder<Bill>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(BillOrder)]),
          () => new ListBuilder<BillOrder>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CartOrdersView)]),
          () => new ListBuilder<CartOrdersView>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CartOrdersView)]),
          () => new ListBuilder<CartOrdersView>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Category)]),
          () => new ListBuilder<Category>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CommentView)]),
          () => new ListBuilder<CommentView>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Food)]),
          () => new ListBuilder<Food>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
