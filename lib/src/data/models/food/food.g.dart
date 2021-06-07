// GENERATED CODE - DO NOT MODIFY BY HAND

part of food;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Food> _$foodSerializer = new _$FoodSerializer();

class _$FoodSerializer implements StructuredSerializer<Food> {
  @override
  final Iterable<Type> types = const [Food, _$Food];
  @override
  final String wireName = 'Food';

  @override
  Iterable<Object> serialize(Serializers serializers, Food object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
    ];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.score;
    if (value != null) {
      result
        ..add('score')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Category)));
    }
    return result;
  }

  @override
  Food deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(Category)) as Category);
          break;
      }
    }

    return result.build();
  }
}

class _$Food extends Food {
  @override
  final int id;
  @override
  final String name;
  @override
  final String detail;
  @override
  final double price;
  @override
  final double score;
  @override
  final int categoryId;
  @override
  final Category category;

  factory _$Food([void Function(FoodBuilder) updates]) =>
      (new FoodBuilder()..update(updates)).build();

  _$Food._(
      {this.id,
      this.name,
      this.detail,
      this.price,
      this.score,
      this.categoryId,
      this.category})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Food', 'name');
    BuiltValueNullFieldError.checkNotNull(price, 'Food', 'price');
  }

  @override
  Food rebuild(void Function(FoodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodBuilder toBuilder() => new FoodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Food &&
        id == other.id &&
        name == other.name &&
        detail == other.detail &&
        price == other.price &&
        score == other.score &&
        categoryId == other.categoryId &&
        category == other.category;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                        detail.hashCode),
                    price.hashCode),
                score.hashCode),
            categoryId.hashCode),
        category.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Food')
          ..add('id', id)
          ..add('name', name)
          ..add('detail', detail)
          ..add('price', price)
          ..add('score', score)
          ..add('categoryId', categoryId)
          ..add('category', category))
        .toString();
  }
}

class FoodBuilder implements Builder<Food, FoodBuilder> {
  _$Food _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  double _score;
  double get score => _$this._score;
  set score(double score) => _$this._score = score;

  int _categoryId;
  int get categoryId => _$this._categoryId;
  set categoryId(int categoryId) => _$this._categoryId = categoryId;

  CategoryBuilder _category;
  CategoryBuilder get category => _$this._category ??= new CategoryBuilder();
  set category(CategoryBuilder category) => _$this._category = category;

  FoodBuilder();

  FoodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _detail = $v.detail;
      _price = $v.price;
      _score = $v.score;
      _categoryId = $v.categoryId;
      _category = $v.category?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Food other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Food;
  }

  @override
  void update(void Function(FoodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Food build() {
    _$Food _$result;
    try {
      _$result = _$v ??
          new _$Food._(
              id: id,
              name: BuiltValueNullFieldError.checkNotNull(name, 'Food', 'name'),
              detail: detail,
              price:
                  BuiltValueNullFieldError.checkNotNull(price, 'Food', 'price'),
              score: score,
              categoryId: categoryId,
              category: _category?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Food', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
