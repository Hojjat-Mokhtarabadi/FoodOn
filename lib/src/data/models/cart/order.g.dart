// GENERATED CODE - DO NOT MODIFY BY HAND

part of order;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Order> _$orderSerializer = new _$OrderSerializer();

class _$OrderSerializer implements StructuredSerializer<Order> {
  @override
  final Iterable<Type> types = const [Order, _$Order];
  @override
  final String wireName = 'Order';

  @override
  Iterable<Object> serialize(Serializers serializers, Order object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'order_id',
      serializers.serialize(object.orderId, specifiedType: const FullType(int)),
      'food_id',
      serializers.serialize(object.foodId, specifiedType: const FullType(int)),
      'food',
      serializers.serialize(object.food, specifiedType: const FullType(Food)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Order deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderBuilder();

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
        case 'order_id':
          result.orderId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'food_id':
          result.foodId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'food':
          result.food.replace(serializers.deserialize(value,
              specifiedType: const FullType(Food)) as Food);
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

class _$Order extends Order {
  @override
  final int id;
  @override
  final int orderId;
  @override
  final int foodId;
  @override
  final Food food;
  @override
  final double price;
  @override
  final int count;

  factory _$Order([void Function(OrderBuilder) updates]) =>
      (new OrderBuilder()..update(updates)).build();

  _$Order._(
      {this.id, this.orderId, this.foodId, this.food, this.price, this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Order', 'id');
    BuiltValueNullFieldError.checkNotNull(orderId, 'Order', 'orderId');
    BuiltValueNullFieldError.checkNotNull(foodId, 'Order', 'foodId');
    BuiltValueNullFieldError.checkNotNull(food, 'Order', 'food');
    BuiltValueNullFieldError.checkNotNull(price, 'Order', 'price');
    BuiltValueNullFieldError.checkNotNull(count, 'Order', 'count');
  }

  @override
  Order rebuild(void Function(OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBuilder toBuilder() => new OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
        id == other.id &&
        orderId == other.orderId &&
        foodId == other.foodId &&
        food == other.food &&
        price == other.price &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), orderId.hashCode),
                    foodId.hashCode),
                food.hashCode),
            price.hashCode),
        count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Order')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('foodId', foodId)
          ..add('food', food)
          ..add('price', price)
          ..add('count', count))
        .toString();
  }
}

class OrderBuilder implements Builder<Order, OrderBuilder> {
  _$Order _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _orderId;
  int get orderId => _$this._orderId;
  set orderId(int orderId) => _$this._orderId = orderId;

  int _foodId;
  int get foodId => _$this._foodId;
  set foodId(int foodId) => _$this._foodId = foodId;

  FoodBuilder _food;
  FoodBuilder get food => _$this._food ??= new FoodBuilder();
  set food(FoodBuilder food) => _$this._food = food;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  OrderBuilder();

  OrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _foodId = $v.foodId;
      _food = $v.food.toBuilder();
      _price = $v.price;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Order other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Order;
  }

  @override
  void update(void Function(OrderBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Order build() {
    _$Order _$result;
    try {
      _$result = _$v ??
          new _$Order._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Order', 'id'),
              orderId: BuiltValueNullFieldError.checkNotNull(
                  orderId, 'Order', 'orderId'),
              foodId: BuiltValueNullFieldError.checkNotNull(
                  foodId, 'Order', 'foodId'),
              food: food.build(),
              price: BuiltValueNullFieldError.checkNotNull(
                  price, 'Order', 'price'),
              count: BuiltValueNullFieldError.checkNotNull(
                  count, 'Order', 'count'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'food';
        food.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Order', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
