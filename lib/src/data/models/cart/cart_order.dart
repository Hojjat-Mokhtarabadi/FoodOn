library cart_order;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'cart_order.g.dart';

abstract class CartOrder implements Built<CartOrder, CartOrderBuilder> {
  // fields go here
  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'cart_id')
  int get cartId;

  @nullable
  @BuiltValueField(wireName: 'food_id')
  int get foodId;

  @nullable
  double get price;

  @nullable
  int get count;

  CartOrder._();

  factory CartOrder([updates(CartOrderBuilder b)]) = _$CartOrder;

  String toJson() {
    return jsonEncode(serializers.serializeWith(CartOrder.serializer, this));
  }

  static CartOrder fromJson(String jsonString) {
    return serializers.deserializeWith(
        CartOrder.serializer, jsonDecode(jsonString));
  }

  static Serializer<CartOrder> get serializer => _$cartOrderSerializer;
}
