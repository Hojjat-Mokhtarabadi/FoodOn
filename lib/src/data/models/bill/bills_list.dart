library bills_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/bill/bill.dart';

import '../serializers.dart';

part 'bills_list.g.dart';

abstract class BillsList implements Built<BillsList, BillsListBuilder> {
  // fields go here
  BuiltList<Bill> get billsList;

  BillsList._();

  factory BillsList([updates(BillsListBuilder b)]) = _$BillsList;

  String toJson() {
    return jsonEncode(serializers.serializeWith(BillsList.serializer, this));
  }

  static BillsList fromJson(String jsonString) {
    return serializers.deserializeWith(
        BillsList.serializer, jsonDecode(jsonString));
  }

  static Serializer<BillsList> get serializer => _$billsListSerializer;
}
