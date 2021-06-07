library orders_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/cart/cart_orders_view.dart';

import '../serializers.dart';

part 'orders_list.g.dart';

abstract class BillOrdersList
    implements Built<BillOrdersList, BillOrdersListBuilder> {
  // fields go here
  BuiltList<CartOrdersView> get ordersList;
  int get orderId;

  DateTime get orderDate;
  @BuiltValueField(wireName: 'totalprice')
  double get totalPrice;

  BillOrdersList._();

  factory BillOrdersList([updates(BillOrdersListBuilder b)]) = _$BillOrdersList;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(BillOrdersList.serializer, this));
  }

  static BillOrdersList fromJson(String jsonString) {
    return serializers.deserializeWith(
        BillOrdersList.serializer, jsonDecode(jsonString));
  }

  static Serializer<BillOrdersList> get serializer =>
      _$billOrdersListSerializer;
}
