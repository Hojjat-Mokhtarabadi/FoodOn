library food;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'food.g.dart';

abstract class Food implements Built<Food, FoodBuilder> {
  // fields go here
  int get id;
  String get name;
  String get detail;
  String get price;
  String get score;

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
