// GENERATED CODE - DO NOT MODIFY BY HAND

part of foods_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriesList> _$categoriesListSerializer =
    new _$CategoriesListSerializer();

class _$CategoriesListSerializer
    implements StructuredSerializer<CategoriesList> {
  @override
  final Iterable<Type> types = const [CategoriesList, _$CategoriesList];
  @override
  final String wireName = 'CategoriesList';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoriesList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'categoriesList',
      serializers.serialize(object.categoriesList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Category)])),
    ];

    return result;
  }

  @override
  CategoriesList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'categoriesList':
          result.categoriesList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Category)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CategoriesList extends CategoriesList {
  @override
  final BuiltList<Category> categoriesList;

  factory _$CategoriesList([void Function(CategoriesListBuilder) updates]) =>
      (new CategoriesListBuilder()..update(updates)).build();

  _$CategoriesList._({this.categoriesList}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoriesList, 'CategoriesList', 'categoriesList');
  }

  @override
  CategoriesList rebuild(void Function(CategoriesListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesListBuilder toBuilder() =>
      new CategoriesListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesList && categoriesList == other.categoriesList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, categoriesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoriesList')
          ..add('categoriesList', categoriesList))
        .toString();
  }
}

class CategoriesListBuilder
    implements Builder<CategoriesList, CategoriesListBuilder> {
  _$CategoriesList _$v;

  ListBuilder<Category> _categoriesList;
  ListBuilder<Category> get categoriesList =>
      _$this._categoriesList ??= new ListBuilder<Category>();
  set categoriesList(ListBuilder<Category> categoriesList) =>
      _$this._categoriesList = categoriesList;

  CategoriesListBuilder();

  CategoriesListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoriesList = $v.categoriesList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriesList;
  }

  @override
  void update(void Function(CategoriesListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoriesList build() {
    _$CategoriesList _$result;
    try {
      _$result =
          _$v ?? new _$CategoriesList._(categoriesList: categoriesList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categoriesList';
        categoriesList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CategoriesList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
