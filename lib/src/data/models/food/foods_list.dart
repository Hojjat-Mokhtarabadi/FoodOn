library foods_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';
import 'food.dart';

part 'foods_list.g.dart';

abstract class FoodsList implements Built<FoodsList, FoodsListBuilder> {
  // fields go here
  BuiltList<Food> get foodsList;

  FoodsList._();

  factory FoodsList([updates(FoodsListBuilder b)]) = _$FoodsList;

  String toJson() {
    return json.encode(serializers.serializeWith(FoodsList.serializer, this));
  }

  static FoodsList fromJson(String jsonString) {
    return serializers.deserializeWith(
        FoodsList.serializer, json.decode(jsonString));
  }

  static Serializer<FoodsList> get serializer => _$foodsListSerializer;
}
