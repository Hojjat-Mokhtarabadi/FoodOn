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
  @nullable
  int get id;

  @BuiltValueField(wireName: 'customer_id')
  @nullable
  int get customerId;

  @nullable
  Customer get customer;

  @BuiltValueField(wireName: 'totalprice')
  @nullable
  double get totalPrice;
  @nullable
  DateTime get date;

  @BuiltValueField(wireName: 'delivery_id')
  @nullable
  int get deliveryId;
  @nullable
  Delivery get delivery;

  Bill._();

  factory Bill([updates(BillBuilder b)]) = _$Bill;

  String toJson() {
    return jsonEncode(serializers.serializeWith(Bill.serializer, this));
  }

  static Bill fromJson(String jsonString) {
    return serializers.deserializeWith(Bill.serializer, jsonDecode(jsonString));
  }

  static Serializer<Bill> get serializer => _$billSerializer;
}
