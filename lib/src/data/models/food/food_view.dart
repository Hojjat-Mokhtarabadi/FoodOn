library food_view;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/food/food.dart';

import '../serializers.dart';

part 'food_view.g.dart';

abstract class FoodView implements Built<FoodView, FoodViewBuilder> {
  // fields go here
  Food get foodDetails;

  bool get existsInCart;

  int get existingFoodId;

  FoodView._();

  factory FoodView([updates(FoodViewBuilder b)]) = _$FoodView;

  String toJson() {
    return jsonEncode(serializers.serializeWith(FoodView.serializer, this));
  }

  static FoodView fromJson(String jsonString) {
    return serializers.deserializeWith(
        FoodView.serializer, jsonDecode(jsonString));
  }

  static Serializer<FoodView> get serializer => _$foodViewSerializer;
}
