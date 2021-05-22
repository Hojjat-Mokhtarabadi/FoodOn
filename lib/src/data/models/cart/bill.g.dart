// GENERATED CODE - DO NOT MODIFY BY HAND

part of bill;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Bill> _$billSerializer = new _$BillSerializer();

class _$BillSerializer implements StructuredSerializer<Bill> {
  @override
  final Iterable<Type> types = const [Bill, _$Bill];
  @override
  final String wireName = 'Bill';

  @override
  Iterable<Object> serialize(Serializers serializers, Bill object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'customer_id',
      serializers.serialize(object.customerId,
          specifiedType: const FullType(int)),
      'customer',
      serializers.serialize(object.customer,
          specifiedType: const FullType(Customer)),
      'totalPrice',
      serializers.serialize(object.totalPrice,
          specifiedType: const FullType(double)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'delivery_id',
      serializers.serialize(object.deliveryId,
          specifiedType: const FullType(int)),
      'delivery',
      serializers.serialize(object.delivery,
          specifiedType: const FullType(Delivery)),
    ];

    return result;
  }

  @override
  Bill deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BillBuilder();

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
        case 'customer_id':
          result.customerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'customer':
          result.customer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Customer)) as Customer);
          break;
        case 'totalPrice':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'delivery_id':
          result.deliveryId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'delivery':
          result.delivery.replace(serializers.deserialize(value,
              specifiedType: const FullType(Delivery)) as Delivery);
          break;
      }
    }

    return result.build();
  }
}

class _$Bill extends Bill {
  @override
  final int id;
  @override
  final int customerId;
  @override
  final Customer customer;
  @override
  final double totalPrice;
  @override
  final DateTime date;
  @override
  final int deliveryId;
  @override
  final Delivery delivery;

  factory _$Bill([void Function(BillBuilder) updates]) =>
      (new BillBuilder()..update(updates)).build();

  _$Bill._(
      {this.id,
      this.customerId,
      this.customer,
      this.totalPrice,
      this.date,
      this.deliveryId,
      this.delivery})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Bill', 'id');
    BuiltValueNullFieldError.checkNotNull(customerId, 'Bill', 'customerId');
    BuiltValueNullFieldError.checkNotNull(customer, 'Bill', 'customer');
    BuiltValueNullFieldError.checkNotNull(totalPrice, 'Bill', 'totalPrice');
    BuiltValueNullFieldError.checkNotNull(date, 'Bill', 'date');
    BuiltValueNullFieldError.checkNotNull(deliveryId, 'Bill', 'deliveryId');
    BuiltValueNullFieldError.checkNotNull(delivery, 'Bill', 'delivery');
  }

  @override
  Bill rebuild(void Function(BillBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BillBuilder toBuilder() => new BillBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bill &&
        id == other.id &&
        customerId == other.customerId &&
        customer == other.customer &&
        totalPrice == other.totalPrice &&
        date == other.date &&
        deliveryId == other.deliveryId &&
        delivery == other.delivery;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), customerId.hashCode),
                        customer.hashCode),
                    totalPrice.hashCode),
                date.hashCode),
            deliveryId.hashCode),
        delivery.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Bill')
          ..add('id', id)
          ..add('customerId', customerId)
          ..add('customer', customer)
          ..add('totalPrice', totalPrice)
          ..add('date', date)
          ..add('deliveryId', deliveryId)
          ..add('delivery', delivery))
        .toString();
  }
}

class BillBuilder implements Builder<Bill, BillBuilder> {
  _$Bill _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _customerId;
  int get customerId => _$this._customerId;
  set customerId(int customerId) => _$this._customerId = customerId;

  CustomerBuilder _customer;
  CustomerBuilder get customer => _$this._customer ??= new CustomerBuilder();
  set customer(CustomerBuilder customer) => _$this._customer = customer;

  double _totalPrice;
  double get totalPrice => _$this._totalPrice;
  set totalPrice(double totalPrice) => _$this._totalPrice = totalPrice;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  int _deliveryId;
  int get deliveryId => _$this._deliveryId;
  set deliveryId(int deliveryId) => _$this._deliveryId = deliveryId;

  DeliveryBuilder _delivery;
  DeliveryBuilder get delivery => _$this._delivery ??= new DeliveryBuilder();
  set delivery(DeliveryBuilder delivery) => _$this._delivery = delivery;

  BillBuilder();

  BillBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _customerId = $v.customerId;
      _customer = $v.customer.toBuilder();
      _totalPrice = $v.totalPrice;
      _date = $v.date;
      _deliveryId = $v.deliveryId;
      _delivery = $v.delivery.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Bill other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Bill;
  }

  @override
  void update(void Function(BillBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Bill build() {
    _$Bill _$result;
    try {
      _$result = _$v ??
          new _$Bill._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Bill', 'id'),
              customerId: BuiltValueNullFieldError.checkNotNull(
                  customerId, 'Bill', 'customerId'),
              customer: customer.build(),
              totalPrice: BuiltValueNullFieldError.checkNotNull(
                  totalPrice, 'Bill', 'totalPrice'),
              date: BuiltValueNullFieldError.checkNotNull(date, 'Bill', 'date'),
              deliveryId: BuiltValueNullFieldError.checkNotNull(
                  deliveryId, 'Bill', 'deliveryId'),
              delivery: delivery.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'customer';
        customer.build();

        _$failedField = 'delivery';
        delivery.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Bill', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
