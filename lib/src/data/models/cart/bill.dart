library bill;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/delivery/delivery.dart';

import '../serializers.dart';

part 'bill.g.dart';

abstract class Bill implements Built<Bill, BillBuilder> {
  // fields go here
  int get id;

  @BuiltValueField(wireName: 'customer_id')
  int get customerId;

  Customer get customer;
  double get totalPrice;
  DateTime get date;

  @BuiltValueField(wireName: 'delivery_id')
  int get deliveryId;

  Delivery get delivery;

  Bill._();

  factory Bill([updates(BillBuilder b)]) = _$Bill;

  String toJson() {
    return json.encode(serializers.serializeWith(Bill.serializer, this));
  }

  static Bill fromJson(String jsonString) {
    return serializers.deserializeWith(
        Bill.serializer, json.decode(jsonString));
  }

  static Serializer<Bill> get serializer => _$billSerializer;
}
