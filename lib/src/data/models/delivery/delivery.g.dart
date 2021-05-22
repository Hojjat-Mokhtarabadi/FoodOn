// GENERATED CODE - DO NOT MODIFY BY HAND

part of delivery;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Delivery> _$deliverySerializer = new _$DeliverySerializer();

class _$DeliverySerializer implements StructuredSerializer<Delivery> {
  @override
  final Iterable<Type> types = const [Delivery, _$Delivery];
  @override
  final String wireName = 'Delivery';

  @override
  Iterable<Object> serialize(Serializers serializers, Delivery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'fName',
      serializers.serialize(object.fName,
          specifiedType: const FullType(String)),
      'lName',
      serializers.serialize(object.lName,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'ready',
      serializers.serialize(object.ready, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Delivery deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliveryBuilder();

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
        case 'fName':
          result.fName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lName':
          result.lName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ready':
          result.ready = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Delivery extends Delivery {
  @override
  final int id;
  @override
  final String fName;
  @override
  final String lName;
  @override
  final String phone;
  @override
  final bool ready;

  factory _$Delivery([void Function(DeliveryBuilder) updates]) =>
      (new DeliveryBuilder()..update(updates)).build();

  _$Delivery._({this.id, this.fName, this.lName, this.phone, this.ready})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Delivery', 'id');
    BuiltValueNullFieldError.checkNotNull(fName, 'Delivery', 'fName');
    BuiltValueNullFieldError.checkNotNull(lName, 'Delivery', 'lName');
    BuiltValueNullFieldError.checkNotNull(phone, 'Delivery', 'phone');
    BuiltValueNullFieldError.checkNotNull(ready, 'Delivery', 'ready');
  }

  @override
  Delivery rebuild(void Function(DeliveryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliveryBuilder toBuilder() => new DeliveryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Delivery &&
        id == other.id &&
        fName == other.fName &&
        lName == other.lName &&
        phone == other.phone &&
        ready == other.ready;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), fName.hashCode), lName.hashCode),
            phone.hashCode),
        ready.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Delivery')
          ..add('id', id)
          ..add('fName', fName)
          ..add('lName', lName)
          ..add('phone', phone)
          ..add('ready', ready))
        .toString();
  }
}

class DeliveryBuilder implements Builder<Delivery, DeliveryBuilder> {
  _$Delivery _$v;

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

  bool _ready;
  bool get ready => _$this._ready;
  set ready(bool ready) => _$this._ready = ready;

  DeliveryBuilder();

  DeliveryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fName = $v.fName;
      _lName = $v.lName;
      _phone = $v.phone;
      _ready = $v.ready;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Delivery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Delivery;
  }

  @override
  void update(void Function(DeliveryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Delivery build() {
    final _$result = _$v ??
        new _$Delivery._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Delivery', 'id'),
            fName: BuiltValueNullFieldError.checkNotNull(
                fName, 'Delivery', 'fName'),
            lName: BuiltValueNullFieldError.checkNotNull(
                lName, 'Delivery', 'lName'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, 'Delivery', 'phone'),
            ready: BuiltValueNullFieldError.checkNotNull(
                ready, 'Delivery', 'ready'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
