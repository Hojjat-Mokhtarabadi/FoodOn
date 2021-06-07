// GENERATED CODE - DO NOT MODIFY BY HAND

part of bills_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BillsList> _$billsListSerializer = new _$BillsListSerializer();

class _$BillsListSerializer implements StructuredSerializer<BillsList> {
  @override
  final Iterable<Type> types = const [BillsList, _$BillsList];
  @override
  final String wireName = 'BillsList';

  @override
  Iterable<Object> serialize(Serializers serializers, BillsList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'billsList',
      serializers.serialize(object.billsList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Bill)])),
    ];

    return result;
  }

  @override
  BillsList deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BillsListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'billsList':
          result.billsList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Bill)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$BillsList extends BillsList {
  @override
  final BuiltList<Bill> billsList;

  factory _$BillsList([void Function(BillsListBuilder) updates]) =>
      (new BillsListBuilder()..update(updates)).build();

  _$BillsList._({this.billsList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(billsList, 'BillsList', 'billsList');
  }

  @override
  BillsList rebuild(void Function(BillsListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BillsListBuilder toBuilder() => new BillsListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BillsList && billsList == other.billsList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, billsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BillsList')
          ..add('billsList', billsList))
        .toString();
  }
}

class BillsListBuilder implements Builder<BillsList, BillsListBuilder> {
  _$BillsList _$v;

  ListBuilder<Bill> _billsList;
  ListBuilder<Bill> get billsList =>
      _$this._billsList ??= new ListBuilder<Bill>();
  set billsList(ListBuilder<Bill> billsList) => _$this._billsList = billsList;

  BillsListBuilder();

  BillsListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _billsList = $v.billsList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BillsList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BillsList;
  }

  @override
  void update(void Function(BillsListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BillsList build() {
    _$BillsList _$result;
    try {
      _$result = _$v ?? new _$BillsList._(billsList: billsList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'billsList';
        billsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BillsList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
