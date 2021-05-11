library foods_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/category/category.dart';

import '../serializers.dart';

part 'categories_list.g.dart';

abstract class CategoriesList
    implements Built<CategoriesList, CategoriesListBuilder> {
  // fields go here
  BuiltList<Category> get categoriesList;

  CategoriesList._();

  factory CategoriesList([updates(CategoriesListBuilder b)]) = _$CategoriesList;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(CategoriesList.serializer, this));
  }

  static CategoriesList fromJson(String jsonString) {
    return serializers.deserializeWith(
        CategoriesList.serializer, jsonDecode(jsonString));
  }

  static Serializer<CategoriesList> get serializer =>
      _$categoriesListSerializer;
}
