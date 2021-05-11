library food;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/category/category.dart';

import '../serializers.dart';

part 'food.g.dart';

abstract class Food implements Built<Food, FoodBuilder> {
  // fields go here
  int get id;
  String get name;
  @nullable
  String get detail;
  double get price;
  @nullable
  double get score;
  @nullable
  @BuiltValueField(wireName: 'category_id')
  int get categoryId;
  @nullable
  Category get category;

  Food._();

  factory Food([updates(FoodBuilder b)]) = _$Food;

  String toJson() {
    return json.encode(serializers.serializeWith(Food.serializer, this));
  }

  static Food fromJson(String jsonString) {
    return serializers.deserializeWith(
        Food.serializer, json.decode(jsonString));
  }

  static Serializer<Food> get serializer => _$foodSerializer;
}
