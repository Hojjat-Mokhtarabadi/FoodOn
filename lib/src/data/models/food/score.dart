library score;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/food.dart';

import '../serializers.dart';

part 'score.g.dart';

abstract class Score implements Built<Score, ScoreBuilder> {
  // fields go here
  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'food_id')
  int get foodId;
  @nullable
  Food get food;

  @nullable
  @BuiltValueField(wireName: 'customer_id')
  int get customerId;
  @nullable
  Customer get customer;

  @nullable
  int get score;

  Score._();

  factory Score([updates(ScoreBuilder b)]) = _$Score;

  String toJson() {
    return jsonEncode(serializers.serializeWith(Score.serializer, this));
  }

  static Score fromJson(String jsonString) {
    return serializers.deserializeWith(
        Score.serializer, jsonDecode(jsonString));
  }

  static Serializer<Score> get serializer => _$scoreSerializer;
}
