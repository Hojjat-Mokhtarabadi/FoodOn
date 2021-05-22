library customer;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'customer.g.dart';

abstract class Customer implements Built<Customer, CustomerBuilder> {
  // fields go here
  @nullable
  int get id;
  @nullable
  @BuiltValueField(wireName: 'fname')
  String get fName;
  @nullable
  @BuiltValueField(wireName: 'lname')
  String get lName;
  @nullable
  String get phone;
  @nullable
  String get password;
  @nullable
  String get address;
  @nullable
  double get wallet;

  Customer._();

  factory Customer([updates(CustomerBuilder b)]) = _$Customer;

  String toJson() {
    return json.encode(serializers.serializeWith(Customer.serializer, this));
  }

  static Customer fromJson(String jsonString) {
    return serializers.deserializeWith(
        Customer.serializer, json.decode(jsonString));
  }

  static Serializer<Customer> get serializer => _$customerSerializer;
}
