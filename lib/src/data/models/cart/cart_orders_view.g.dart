// GENERATED CODE - DO NOT MODIFY BY HAND

part of cart_orders_view;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartOrdersView> _$cartOrdersViewSerializer =
    new _$CartOrdersViewSerializer();

class _$CartOrdersViewSerializer
    implements StructuredSerializer<CartOrdersView> {
  @override
  final Iterable<Type> types = const [CartOrdersView, _$CartOrdersView];
  @override
  final String wireName = 'CartOrdersView';

  @override
  Iterable<Object> serialize(Serializers serializers, CartOrdersView object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
    ];
    Object value;
    value = object.foodId;
    if (value != null) {
      result
        ..add('food_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CartOrdersView deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartOrdersViewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'food_id':
          result.foodId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$CartOrdersView extends CartOrdersView {
  @override
  final int foodId;
  @override
  final String name;
  @override
  final int count;
  @override
  final double price;

  factory _$CartOrdersView([void Function(CartOrdersViewBuilder) updates]) =>
      (new CartOrdersViewBuilder()..update(updates)).build();

  _$CartOrdersView._({this.foodId, this.name, this.count, this.price})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'CartOrdersView', 'name');
    BuiltValueNullFieldError.checkNotNull(count, 'CartOrdersView', 'count');
    BuiltValueNullFieldError.checkNotNull(price, 'CartOrdersView', 'price');
  }

  @override
  CartOrdersView rebuild(void Function(CartOrdersViewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartOrdersViewBuilder toBuilder() =>
      new CartOrdersViewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartOrdersView &&
        foodId == other.foodId &&
        name == other.name &&
        count == other.count &&
        price == other.price;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, foodId.hashCode), name.hashCode), count.hashCode),
        price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CartOrdersView')
          ..add('foodId', foodId)
          ..add('name', name)
          ..add('count', count)
          ..add('price', price))
        .toString();
  }
}

class CartOrdersViewBuilder
    implements Builder<CartOrdersView, CartOrdersViewBuilder> {
  _$CartOrdersView _$v;

  int _foodId;
  int get foodId => _$this._foodId;
  set foodId(int foodId) => _$this._foodId = foodId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  CartOrdersViewBuilder();

  CartOrdersViewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foodId = $v.foodId;
      _name = $v.name;
      _count = $v.count;
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartOrdersView other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartOrdersView;
  }

  @override
  void update(void Function(CartOrdersViewBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CartOrdersView build() {
    final _$result = _$v ??
        new _$CartOrdersView._(
            foodId: foodId,
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'CartOrdersView', 'name'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, 'CartOrdersView', 'count'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, 'CartOrdersView', 'price'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
