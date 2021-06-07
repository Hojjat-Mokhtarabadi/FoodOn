// GENERATED CODE - DO NOT MODIFY BY HAND

part of score;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Score> _$scoreSerializer = new _$ScoreSerializer();

class _$ScoreSerializer implements StructuredSerializer<Score> {
  @override
  final Iterable<Type> types = const [Score, _$Score];
  @override
  final String wireName = 'Score';

  @override
  Iterable<Object> serialize(Serializers serializers, Score object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.foodId;
    if (value != null) {
      result
        ..add('food_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.food;
    if (value != null) {
      result
        ..add('food')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Food)));
    }
    value = object.customerId;
    if (value != null) {
      result
        ..add('customer_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.customer;
    if (value != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Customer)));
    }
    value = object.score;
    if (value != null) {
      result
        ..add('score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Score deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScoreBuilder();

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
        case 'food_id':
          result.foodId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'food':
          result.food.replace(serializers.deserialize(value,
              specifiedType: const FullType(Food)) as Food);
          break;
        case 'customer_id':
          result.customerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'customer':
          result.customer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Customer)) as Customer);
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Score extends Score {
  @override
  final int id;
  @override
  final int foodId;
  @override
  final Food food;
  @override
  final int customerId;
  @override
  final Customer customer;
  @override
  final int score;

  factory _$Score([void Function(ScoreBuilder) updates]) =>
      (new ScoreBuilder()..update(updates)).build();

  _$Score._(
      {this.id,
      this.foodId,
      this.food,
      this.customerId,
      this.customer,
      this.score})
      : super._();

  @override
  Score rebuild(void Function(ScoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScoreBuilder toBuilder() => new ScoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Score &&
        id == other.id &&
        foodId == other.foodId &&
        food == other.food &&
        customerId == other.customerId &&
        customer == other.customer &&
        score == other.score;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), foodId.hashCode), food.hashCode),
                customerId.hashCode),
            customer.hashCode),
        score.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Score')
          ..add('id', id)
          ..add('foodId', foodId)
          ..add('food', food)
          ..add('customerId', customerId)
          ..add('customer', customer)
          ..add('score', score))
        .toString();
  }
}

class ScoreBuilder implements Builder<Score, ScoreBuilder> {
  _$Score _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _foodId;
  int get foodId => _$this._foodId;
  set foodId(int foodId) => _$this._foodId = foodId;

  FoodBuilder _food;
  FoodBuilder get food => _$this._food ??= new FoodBuilder();
  set food(FoodBuilder food) => _$this._food = food;

  int _customerId;
  int get customerId => _$this._customerId;
  set customerId(int customerId) => _$this._customerId = customerId;

  CustomerBuilder _customer;
  CustomerBuilder get customer => _$this._customer ??= new CustomerBuilder();
  set customer(CustomerBuilder customer) => _$this._customer = customer;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  ScoreBuilder();

  ScoreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _foodId = $v.foodId;
      _food = $v.food?.toBuilder();
      _customerId = $v.customerId;
      _customer = $v.customer?.toBuilder();
      _score = $v.score;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Score other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Score;
  }

  @override
  void update(void Function(ScoreBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Score build() {
    _$Score _$result;
    try {
      _$result = _$v ??
          new _$Score._(
              id: id,
              foodId: foodId,
              food: _food?.build(),
              customerId: customerId,
              customer: _customer?.build(),
              score: score);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'food';
        _food?.build();

        _$failedField = 'customer';
        _customer?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Score', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
