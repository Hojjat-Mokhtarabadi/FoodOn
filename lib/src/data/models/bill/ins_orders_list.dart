library ins_orders_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/bill/order.dart';

import '../serializers.dart';

part 'ins_orders_list.g.dart';

abstract class OrdersList implements Built<OrdersList, OrdersListBuilder> {
  // fields go here
  BuiltList<BillOrder> get ordersList;

  OrdersList._();

  factory OrdersList([updates(OrdersListBuilder b)]) = _$OrdersList;

  String toJson() {
    return jsonEncode(serializers.serializeWith(OrdersList.serializer, this));
  }

  static OrdersList fromJson(String jsonString) {
    return serializers.deserializeWith(
        OrdersList.serializer, jsonDecode(jsonString));
  }

  static Serializer<OrdersList> get serializer => _$ordersListSerializer;
}
