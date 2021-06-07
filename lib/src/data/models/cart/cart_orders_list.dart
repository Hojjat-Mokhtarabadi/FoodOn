library cart_orders_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';

import '../serializers.dart';

part 'cart_orders_list.g.dart';

abstract class CartOrdersList
    implements Built<CartOrdersList, CartOrdersListBuilder> {
  // fields go here

  BuiltList<CartOrdersView> get cartItemsList;

  CartOrdersList._();

  factory CartOrdersList([updates(CartOrdersListBuilder b)]) = _$CartOrdersList;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(CartOrdersList.serializer, this));
  }

  static CartOrdersList fromJson(String jsonString) {
    return serializers.deserializeWith(
        CartOrdersList.serializer, jsonDecode(jsonString));
  }

  static Serializer<CartOrdersList> get serializer =>
      _$cartOrdersListSerializer;
}
