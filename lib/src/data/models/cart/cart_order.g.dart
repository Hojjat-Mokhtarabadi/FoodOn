// GENERATED CODE - DO NOT MODIFY BY HAND

part of cart_order;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartOrder> _$cartOrderSerializer = new _$CartOrderSerializer();

class _$CartOrderSerializer implements StructuredSerializer<CartOrder> {
  @override
  final Iterable<Type> types = const [CartOrder, _$CartOrder];
  @override
  final String wireName = 'CartOrder';

  @override
  Iterable<Object> serialize(Serializers serializers, CartOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cartId;
    if (value != null) {
      result
        ..add('cart_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodId;
    if (value != null) {
      result
        ..add('food_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CartOrder deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'cart_id':
          result.cartId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'food_id':
          result.foodId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CartOrder extends CartOrder {
  @override
  final int id;
  @override
  final int cartId;
  @override
  final int foodId;
  @override
  final double price;
  @override
  final int count;

  factory _$CartOrder([void Function(CartOrderBuilder) updates]) =>
      (new CartOrderBuilder()..update(updates)).build();

  _$CartOrder._({this.id, this.cartId, this.foodId, this.price, this.count})
      : super._();

  @override
  CartOrder rebuild(void Function(CartOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartOrderBuilder toBuilder() => new CartOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartOrder &&
        id == other.id &&
        cartId == other.cartId &&
        foodId == other.foodId &&
        price == other.price &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), cartId.hashCode), foodId.hashCode),
            price.hashCode),
        count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CartOrder')
          ..add('id', id)
          ..add('cartId', cartId)
          ..add('foodId', foodId)
          ..add('price', price)
          ..add('count', count))
        .toString();
  }
}

class CartOrderBuilder implements Builder<CartOrder, CartOrderBuilder> {
  _$CartOrder _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _cartId;
  int get cartId => _$this._cartId;
  set cartId(int cartId) => _$this._cartId = cartId;

  int _foodId;
  int get foodId => _$this._foodId;
  set foodId(int foodId) => _$this._foodId = foodId;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  CartOrderBuilder();

  CartOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _cartId = $v.cartId;
      _foodId = $v.foodId;
      _price = $v.price;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartOrder;
  }

  @override
  void update(void Function(CartOrderBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CartOrder build() {
    final _$result = _$v ??
        new _$CartOrder._(
            id: id, cartId: cartId, foodId: foodId, price: price, count: count);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
