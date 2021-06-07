// GENERATED CODE - DO NOT MODIFY BY HAND

part of food_view;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodView> _$foodViewSerializer = new _$FoodViewSerializer();

class _$FoodViewSerializer implements StructuredSerializer<FoodView> {
  @override
  final Iterable<Type> types = const [FoodView, _$FoodView];
  @override
  final String wireName = 'FoodView';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodView object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'foodDetails',
      serializers.serialize(object.foodDetails,
          specifiedType: const FullType(Food)),
      'existsInCart',
      serializers.serialize(object.existsInCart,
          specifiedType: const FullType(bool)),
      'existingFoodId',
      serializers.serialize(object.existingFoodId,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  FoodView deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodViewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'foodDetails':
          result.foodDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(Food)) as Food);
          break;
        case 'existsInCart':
          result.existsInCart = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'existingFoodId':
          result.existingFoodId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodView extends FoodView {
  @override
  final Food foodDetails;
  @override
  final bool existsInCart;
  @override
  final int existingFoodId;

  factory _$FoodView([void Function(FoodViewBuilder) updates]) =>
      (new FoodViewBuilder()..update(updates)).build();

  _$FoodView._({this.foodDetails, this.existsInCart, this.existingFoodId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        foodDetails, 'FoodView', 'foodDetails');
    BuiltValueNullFieldError.checkNotNull(
        existsInCart, 'FoodView', 'existsInCart');
    BuiltValueNullFieldError.checkNotNull(
        existingFoodId, 'FoodView', 'existingFoodId');
  }

  @override
  FoodView rebuild(void Function(FoodViewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodViewBuilder toBuilder() => new FoodViewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodView &&
        foodDetails == other.foodDetails &&
        existsInCart == other.existsInCart &&
        existingFoodId == other.existingFoodId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, foodDetails.hashCode), existsInCart.hashCode),
        existingFoodId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodView')
          ..add('foodDetails', foodDetails)
          ..add('existsInCart', existsInCart)
          ..add('existingFoodId', existingFoodId))
        .toString();
  }
}

class FoodViewBuilder implements Builder<FoodView, FoodViewBuilder> {
  _$FoodView _$v;

  FoodBuilder _foodDetails;
  FoodBuilder get foodDetails => _$this._foodDetails ??= new FoodBuilder();
  set foodDetails(FoodBuilder foodDetails) => _$this._foodDetails = foodDetails;

  bool _existsInCart;
  bool get existsInCart => _$this._existsInCart;
  set existsInCart(bool existsInCart) => _$this._existsInCart = existsInCart;

  int _existingFoodId;
  int get existingFoodId => _$this._existingFoodId;
  set existingFoodId(int existingFoodId) =>
      _$this._existingFoodId = existingFoodId;

  FoodViewBuilder();

  FoodViewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _foodDetails = $v.foodDetails.toBuilder();
      _existsInCart = $v.existsInCart;
      _existingFoodId = $v.existingFoodId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodView other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodView;
  }

  @override
  void update(void Function(FoodViewBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodView build() {
    _$FoodView _$result;
    try {
      _$result = _$v ??
          new _$FoodView._(
              foodDetails: foodDetails.build(),
              existsInCart: BuiltValueNullFieldError.checkNotNull(
                  existsInCart, 'FoodView', 'existsInCart'),
              existingFoodId: BuiltValueNullFieldError.checkNotNull(
                  existingFoodId, 'FoodView', 'existingFoodId'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDetails';
        foodDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodView', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
