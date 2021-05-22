// GENERATED CODE - DO NOT MODIFY BY HAND

part of orders_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersList> _$ordersListSerializer = new _$OrdersListSerializer();

class _$OrdersListSerializer implements StructuredSerializer<OrdersList> {
  @override
  final Iterable<Type> types = const [OrdersList, _$OrdersList];
  @override
  final String wireName = 'OrdersList';

  @override
  Iterable<Object> serialize(Serializers serializers, OrdersList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ordersList',
      serializers.serialize(object.ordersList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Order)])),
    ];

    return result;
  }

  @override
  OrdersList deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'ordersList':
          result.ordersList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Order)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$OrdersList extends OrdersList {
  @override
  final BuiltList<Order> ordersList;

  factory _$OrdersList([void Function(OrdersListBuilder) updates]) =>
      (new OrdersListBuilder()..update(updates)).build();

  _$OrdersList._({this.ordersList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ordersList, 'OrdersList', 'ordersList');
  }

  @override
  OrdersList rebuild(void Function(OrdersListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersListBuilder toBuilder() => new OrdersListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersList && ordersList == other.ordersList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ordersList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrdersList')
          ..add('ordersList', ordersList))
        .toString();
  }
}

class OrdersListBuilder implements Builder<OrdersList, OrdersListBuilder> {
  _$OrdersList _$v;

  ListBuilder<Order> _ordersList;
  ListBuilder<Order> get ordersList =>
      _$this._ordersList ??= new ListBuilder<Order>();
  set ordersList(ListBuilder<Order> ordersList) =>
      _$this._ordersList = ordersList;

  OrdersListBuilder();

  OrdersListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ordersList = $v.ordersList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersList;
  }

  @override
  void update(void Function(OrdersListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrdersList build() {
    _$OrdersList _$result;
    try {
      _$result = _$v ?? new _$OrdersList._(ordersList: ordersList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ordersList';
        ordersList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrdersList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
