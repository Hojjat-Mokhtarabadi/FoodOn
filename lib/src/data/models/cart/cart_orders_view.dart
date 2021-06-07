library cart_orders_view;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'cart_orders_view.g.dart';

abstract class CartOrdersView
    implements Built<CartOrdersView, CartOrdersViewBuilder> {
  // fields go here
  @nullable
  @BuiltValueField(wireName: 'food_id')
  int get foodId;

  String get name;

  int get count;

  double get price;

  CartOrdersView._();

  factory CartOrdersView([updates(CartOrdersViewBuilder b)]) = _$CartOrdersView;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(CartOrdersView.serializer, this));
  }

  static CartOrdersView fromJson(String jsonString) {
    return serializers.deserializeWith(
        CartOrdersView.serializer, jsonDecode(jsonString));
  }

  static Serializer<CartOrdersView> get serializer =>
      _$cartOrdersViewSerializer;
}
