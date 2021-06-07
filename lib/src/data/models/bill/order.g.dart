// GENERATED CODE - DO NOT MODIFY BY HAND

part of order;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BillOrder> _$billOrderSerializer = new _$BillOrderSerializer();

class _$BillOrderSerializer implements StructuredSerializer<BillOrder> {
  @override
  final Iterable<Type> types = const [BillOrder, _$BillOrder];
  @override
  final String wireName = 'BillOrder';

  @override
  Iterable<Object> serialize(Serializers serializers, BillOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.orderId;
    if (value != null) {
      result
        ..add('order_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodId;
    if (value != null) {
      result
        ..add('food_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BillOrder deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BillOrderBuilder();

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

class _$BillOrder extends BillOrder {
  @override
  final int id;
  @override
  final int orderId;
  @override
  final int foodId;
  @override
  final double price;
  @override
  final int count;

  factory _$BillOrder([void Function(BillOrderBuilder) updates]) =>
      (new BillOrderBuilder()..update(updates)).build();

  _$BillOrder._({this.id, this.orderId, this.foodId, this.price, this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(price, 'BillOrder', 'price');
    BuiltValueNullFieldError.checkNotNull(count, 'BillOrder', 'count');
  }

  @override
  BillOrder rebuild(void Function(BillOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BillOrderBuilder toBuilder() => new BillOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BillOrder &&
        id == other.id &&
        orderId == other.orderId &&
        foodId == other.foodId &&
        price == other.price &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), orderId.hashCode), foodId.hashCode),
            price.hashCode),
        count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BillOrder')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('foodId', foodId)
          ..add('price', price)
          ..add('count', count))
        .toString();
  }
}

class BillOrderBuilder implements Builder<BillOrder, BillOrderBuilder> {
  _$BillOrder _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _orderId;
  int get orderId => _$this._orderId;
  set orderId(int orderId) => _$this._orderId = orderId;

  int _foodId;
  int get foodId => _$this._foodId;
  set foodId(int foodId) => _$this._foodId = foodId;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  BillOrderBuilder();

  BillOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _foodId = $v.foodId;
      _price = $v.price;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BillOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BillOrder;
  }

  @override
  void update(void Function(BillOrderBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BillOrder build() {
    final _$result = _$v ??
        new _$BillOrder._(
            id: id,
            orderId: orderId,
            foodId: foodId,
            price: BuiltValueNullFieldError.checkNotNull(
                price, 'BillOrder', 'price'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, 'BillOrder', 'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
