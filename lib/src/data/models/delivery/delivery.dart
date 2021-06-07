library delivery;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'delivery.g.dart';

abstract class Delivery implements Built<Delivery, DeliveryBuilder> {
  // fields go here
  int get id;
  String get fName;
  String get lName;
  String get phone;
  bool get ready;

  Delivery._();

  factory Delivery([updates(DeliveryBuilder b)]) = _$Delivery;

  String toJson() {
    return jsonEncode(serializers.serializeWith(Delivery.serializer, this));
  }

  static Delivery fromJson(String jsonString) {
    return serializers.deserializeWith(
        Delivery.serializer, jsonDecode(jsonString));
  }

  static Serializer<Delivery> get serializer => _$deliverySerializer;
}
