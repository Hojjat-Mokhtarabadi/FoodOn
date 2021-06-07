library order;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'order.g.dart';

abstract class BillOrder implements Built<BillOrder, BillOrderBuilder> {
  // fields go here
  @nullable
  int get id;
  @BuiltValueField(wireName: 'order_id')
  @nullable
  int get orderId;
  @BuiltValueField(wireName: 'food_id')
  @nullable
  int get foodId;
  double get price;
  int get count;

  BillOrder._();

  factory BillOrder([updates(BillOrderBuilder b)]) = _$BillOrder;

  String toJson() {
    return jsonEncode(serializers.serializeWith(BillOrder.serializer, this));
  }

  static BillOrder fromJson(String jsonString) {
    return serializers.deserializeWith(
        BillOrder.serializer, jsonDecode(jsonString));
  }

  static Serializer<BillOrder> get serializer => _$billOrderSerializer;
}
