library order;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/food/food.dart';

import '../serializers.dart';

part 'order.g.dart';

abstract class Order implements Built<Order, OrderBuilder> {
  // fields go here
  int get id;

  @BuiltValueField(wireName: 'order_id')
  int get orderId;

  @BuiltValueField(wireName: 'food_id')
  int get foodId;

  Food get food;

  double get price;

  int get count;

  Order._();

  factory Order([updates(OrderBuilder b)]) = _$Order;

  String toJson() {
    return json.encode(serializers.serializeWith(Order.serializer, this));
  }

  static Order fromJson(String jsonString) {
    return serializers.deserializeWith(
        Order.serializer, json.decode(jsonString));
  }

  static Serializer<Order> get serializer => _$orderSerializer;
}
