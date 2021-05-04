// GENERATED CODE - DO NOT MODIFY BY HAND

part of foods_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodsList> _$foodsListSerializer = new _$FoodsListSerializer();

class _$FoodsListSerializer implements StructuredSerializer<FoodsList> {
  @override
  final Iterable<Type> types = const [FoodsList, _$FoodsList];
  @override
  final String wireName = 'FoodsList';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodsList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'foodsList',
      serializers.serialize(object.foodsList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Food)])),
    ];

    return result;
  }

  @override
  FoodsList deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodsListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'foodsList':
          result.foodsList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Food)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$FoodsList extends FoodsList {
  @override
  final BuiltList<Food> foodsList;

  factory _$FoodsList([void Function(FoodsListBuilder) updates]) =>
      (new FoodsListBuilder()..update(updates)).build();

  _$FoodsList._({this.foodsList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(foodsList, 'FoodsList', 'foodsList');
  }

  @override
  FoodsList rebuild(void Function(FoodsListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodsListBuilder toBuilder() => new FoodsListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodsList && foodsList == other.foodsList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodsList')
          ..add('foodsList', foodsList))
        .toString();
  }
}

class FoodsListBuilder implements Builder<FoodsList, FoodsListBuilder> {
  _$FoodsList _$v;

  ListBuilder<Food> _foodsList;
  ListBuilder<Food> get foodsList =>
      _$this._foodsList ??= new ListBuilder<Food>();
  set foodsList(ListBuilder<Food> foodsList) => _$this._foodsList = foodsList;

  FoodsListBuilder();

  FoodsListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foodsList = $v.foodsList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodsList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodsList;
  }

  @override
  void update(void Function(FoodsListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodsList build() {
    _$FoodsList _$result;
    try {
      _$result = _$v ?? new _$FoodsList._(foodsList: foodsList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodsList';
        foodsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodsList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
