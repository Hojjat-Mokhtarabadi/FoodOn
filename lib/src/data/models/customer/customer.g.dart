// GENERATED CODE - DO NOT MODIFY BY HAND

part of customer;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Customer> _$customerSerializer = new _$CustomerSerializer();

class _$CustomerSerializer implements StructuredSerializer<Customer> {
  @override
  final Iterable<Type> types = const [Customer, _$Customer];
  @override
  final String wireName = 'Customer';

  @override
  Iterable<Object> serialize(Serializers serializers, Customer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fName;
    if (value != null) {
      result
        ..add('fname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lName;
    if (value != null) {
      result
        ..add('lname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wallet;
    if (value != null) {
      result
        ..add('wallet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Customer deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerBuilder();

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
        case 'fname':
          result.fName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lname':
          result.lName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet':
          result.wallet = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Customer extends Customer {
  @override
  final int id;
  @override
  final String fName;
  @override
  final String lName;
  @override
  final String phone;
  @override
  final String password;
  @override
  final String address;
  @override
  final double wallet;

  factory _$Customer([void Function(CustomerBuilder) updates]) =>
      (new CustomerBuilder()..update(updates)).build();

  _$Customer._(
      {this.id,
      this.fName,
      this.lName,
      this.phone,
      this.password,
      this.address,
      this.wallet})
      : super._();

  @override
  Customer rebuild(void Function(CustomerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerBuilder toBuilder() => new CustomerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
        id == other.id &&
        fName == other.fName &&
        lName == other.lName &&
        phone == other.phone &&
        password == other.password &&
        address == other.address &&
        wallet == other.wallet;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), fName.hashCode),
                        lName.hashCode),
                    phone.hashCode),
                password.hashCode),
            address.hashCode),
        wallet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Customer')
          ..add('id', id)
          ..add('fName', fName)
          ..add('lName', lName)
          ..add('phone', phone)
          ..add('password', password)
          ..add('address', address)
          ..add('wallet', wallet))
        .toString();
  }
}

class CustomerBuilder implements Builder<Customer, CustomerBuilder> {
  _$Customer _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _fName;
  String get fName => _$this._fName;
  set fName(String fName) => _$this._fName = fName;

  String _lName;
  String get lName => _$this._lName;
  set lName(String lName) => _$this._lName = lName;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  double _wallet;
  double get wallet => _$this._wallet;
  set wallet(double wallet) => _$this._wallet = wallet;

  CustomerBuilder();

  CustomerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fName = $v.fName;
      _lName = $v.lName;
      _phone = $v.phone;
      _password = $v.password;
      _address = $v.address;
      _wallet = $v.wallet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Customer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Customer;
  }

  @override
  void update(void Function(CustomerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Customer build() {
    final _$result = _$v ??
        new _$Customer._(
            id: id,
            fName: fName,
            lName: lName,
            phone: phone,
            password: password,
            address: address,
            wallet: wallet);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
