// GENERATED CODE - DO NOT MODIFY BY HAND

part of authentication_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthenticationResponse> _$authenticationResponseSerializer =
    new _$AuthenticationResponseSerializer();

class _$AuthenticationResponseSerializer
    implements StructuredSerializer<AuthenticationResponse> {
  @override
  final Iterable<Type> types = const [
    AuthenticationResponse,
    _$AuthenticationResponse
  ];
  @override
  final String wireName = 'AuthenticationResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userInfo',
      serializers.serialize(object.userInfo,
          specifiedType: const FullType(Customer)),
      'cartId',
      serializers.serialize(object.cartId, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  AuthenticationResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthenticationResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'userInfo':
          result.userInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(Customer)) as Customer);
          break;
        case 'cartId':
          result.cartId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthenticationResponse extends AuthenticationResponse {
  @override
  final Customer userInfo;
  @override
  final int cartId;

  factory _$AuthenticationResponse(
          [void Function(AuthenticationResponseBuilder) updates]) =>
      (new AuthenticationResponseBuilder()..update(updates)).build();

  _$AuthenticationResponse._({this.userInfo, this.cartId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userInfo, 'AuthenticationResponse', 'userInfo');
    BuiltValueNullFieldError.checkNotNull(
        cartId, 'AuthenticationResponse', 'cartId');
  }

  @override
  AuthenticationResponse rebuild(
          void Function(AuthenticationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationResponseBuilder toBuilder() =>
      new AuthenticationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationResponse &&
        userInfo == other.userInfo &&
        cartId == other.cartId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userInfo.hashCode), cartId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthenticationResponse')
          ..add('userInfo', userInfo)
          ..add('cartId', cartId))
        .toString();
  }
}

class AuthenticationResponseBuilder
    implements Builder<AuthenticationResponse, AuthenticationResponseBuilder> {
  _$AuthenticationResponse _$v;

  CustomerBuilder _userInfo;
  CustomerBuilder get userInfo => _$this._userInfo ??= new CustomerBuilder();
  set userInfo(CustomerBuilder userInfo) => _$this._userInfo = userInfo;

  int _cartId;
  int get cartId => _$this._cartId;
  set cartId(int cartId) => _$this._cartId = cartId;

  AuthenticationResponseBuilder();

  AuthenticationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userInfo = $v.userInfo.toBuilder();
      _cartId = $v.cartId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticationResponse;
  }

  @override
  void update(void Function(AuthenticationResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationResponse build() {
    _$AuthenticationResponse _$result;
    try {
      _$result = _$v ??
          new _$AuthenticationResponse._(
              userInfo: userInfo.build(),
              cartId: BuiltValueNullFieldError.checkNotNull(
                  cartId, 'AuthenticationResponse', 'cartId'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userInfo';
        userInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthenticationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
