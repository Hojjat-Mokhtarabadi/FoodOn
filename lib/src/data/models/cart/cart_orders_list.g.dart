// GENERATED CODE - DO NOT MODIFY BY HAND

part of cart_orders_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartOrdersList> _$cartOrdersListSerializer =
    new _$CartOrdersListSerializer();

class _$CartOrdersListSerializer
    implements StructuredSerializer<CartOrdersList> {
  @override
  final Iterable<Type> types = const [CartOrdersList, _$CartOrdersList];
  @override
  final String wireName = 'CartOrdersList';

  @override
  Iterable<Object> serialize(Serializers serializers, CartOrdersList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cartItemsList',
      serializers.serialize(object.cartItemsList,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CartOrdersView)])),
    ];

    return result;
  }

  @override
  CartOrdersList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartOrdersListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'cartItemsList':
          result.cartItemsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CartOrdersView)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CartOrdersList extends CartOrdersList {
  @override
  final BuiltList<CartOrdersView> cartItemsList;

  factory _$CartOrdersList([void Function(CartOrdersListBuilder) updates]) =>
      (new CartOrdersListBuilder()..update(updates)).build();

  _$CartOrdersList._({this.cartItemsList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        cartItemsList, 'CartOrdersList', 'cartItemsList');
  }

  @override
  CartOrdersList rebuild(void Function(CartOrdersListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartOrdersListBuilder toBuilder() =>
      new CartOrdersListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartOrdersList && cartItemsList == other.cartItemsList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, cartItemsList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CartOrdersList')
          ..add('cartItemsList', cartItemsList))
        .toString();
  }
}

class CartOrdersListBuilder
    implements Builder<CartOrdersList, CartOrdersListBuilder> {
  _$CartOrdersList _$v;

  ListBuilder<CartOrdersView> _cartItemsList;
  ListBuilder<CartOrdersView> get cartItemsList =>
      _$this._cartItemsList ??= new ListBuilder<CartOrdersView>();
  set cartItemsList(ListBuilder<CartOrdersView> cartItemsList) =>
      _$this._cartItemsList = cartItemsList;

  CartOrdersListBuilder();

  CartOrdersListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cartItemsList = $v.cartItemsList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartOrdersList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartOrdersList;
  }

  @override
  void update(void Function(CartOrdersListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CartOrdersList build() {
    _$CartOrdersList _$result;
    try {
      _$result =
          _$v ?? new _$CartOrdersList._(cartItemsList: cartItemsList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cartItemsList';
        cartItemsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CartOrdersList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
