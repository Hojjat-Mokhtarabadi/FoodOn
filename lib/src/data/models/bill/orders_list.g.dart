// GENERATED CODE - DO NOT MODIFY BY HAND

part of orders_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BillOrdersList> _$billOrdersListSerializer =
    new _$BillOrdersListSerializer();

class _$BillOrdersListSerializer
    implements StructuredSerializer<BillOrdersList> {
  @override
  final Iterable<Type> types = const [BillOrdersList, _$BillOrdersList];
  @override
  final String wireName = 'BillOrdersList';

  @override
  Iterable<Object> serialize(Serializers serializers, BillOrdersList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ordersList',
      serializers.serialize(object.ordersList,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CartOrdersView)])),
      'orderId',
      serializers.serialize(object.orderId, specifiedType: const FullType(int)),
      'orderDate',
      serializers.serialize(object.orderDate,
          specifiedType: const FullType(DateTime)),
      'totalprice',
      serializers.serialize(object.totalPrice,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  BillOrdersList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BillOrdersListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'ordersList':
          result.ordersList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CartOrdersView)]))
              as BuiltList<Object>);
          break;
        case 'orderId':
          result.orderId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'orderDate':
          result.orderDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'totalprice':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$BillOrdersList extends BillOrdersList {
  @override
  final BuiltList<CartOrdersView> ordersList;
  @override
  final int orderId;
  @override
  final DateTime orderDate;
  @override
  final double totalPrice;

  factory _$BillOrdersList([void Function(BillOrdersListBuilder) updates]) =>
      (new BillOrdersListBuilder()..update(updates)).build();

  _$BillOrdersList._(
      {this.ordersList, this.orderId, this.orderDate, this.totalPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ordersList, 'BillOrdersList', 'ordersList');
    BuiltValueNullFieldError.checkNotNull(orderId, 'BillOrdersList', 'orderId');
    BuiltValueNullFieldError.checkNotNull(
        orderDate, 'BillOrdersList', 'orderDate');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, 'BillOrdersList', 'totalPrice');
  }

  @override
  BillOrdersList rebuild(void Function(BillOrdersListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BillOrdersListBuilder toBuilder() =>
      new BillOrdersListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BillOrdersList &&
        ordersList == other.ordersList &&
        orderId == other.orderId &&
        orderDate == other.orderDate &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, ordersList.hashCode), orderId.hashCode),
            orderDate.hashCode),
        totalPrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BillOrdersList')
          ..add('ordersList', ordersList)
          ..add('orderId', orderId)
          ..add('orderDate', orderDate)
          ..add('totalPrice', totalPrice))
        .toString();
  }
}

class BillOrdersListBuilder
    implements Builder<BillOrdersList, BillOrdersListBuilder> {
  _$BillOrdersList _$v;

  ListBuilder<CartOrdersView> _ordersList;
  ListBuilder<CartOrdersView> get ordersList =>
      _$this._ordersList ??= new ListBuilder<CartOrdersView>();
  set ordersList(ListBuilder<CartOrdersView> ordersList) =>
      _$this._ordersList = ordersList;

  int _orderId;
  int get orderId => _$this._orderId;
  set orderId(int orderId) => _$this._orderId = orderId;

  DateTime _orderDate;
  DateTime get orderDate => _$this._orderDate;
  set orderDate(DateTime orderDate) => _$this._orderDate = orderDate;

  double _totalPrice;
  double get totalPrice => _$this._totalPrice;
  set totalPrice(double totalPrice) => _$this._totalPrice = totalPrice;

  BillOrdersListBuilder();

  BillOrdersListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ordersList = $v.ordersList.toBuilder();
      _orderId = $v.orderId;
      _orderDate = $v.orderDate;
      _totalPrice = $v.totalPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BillOrdersList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BillOrdersList;
  }

  @override
  void update(void Function(BillOrdersListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BillOrdersList build() {
    _$BillOrdersList _$result;
    try {
      _$result = _$v ??
          new _$BillOrdersList._(
              ordersList: ordersList.build(),
              orderId: BuiltValueNullFieldError.checkNotNull(
                  orderId, 'BillOrdersList', 'orderId'),
              orderDate: BuiltValueNullFieldError.checkNotNull(
                  orderDate, 'BillOrdersList', 'orderDate'),
              totalPrice: BuiltValueNullFieldError.checkNotNull(
                  totalPrice, 'BillOrdersList', 'totalPrice'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ordersList';
        ordersList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BillOrdersList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
