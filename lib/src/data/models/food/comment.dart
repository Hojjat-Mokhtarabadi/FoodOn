library comment;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/customer/customer.dart';
import 'package:foodon/src/data/models/food/food.dart';

import '../serializers.dart';

part 'comment.g.dart';

abstract class Comment implements Built<Comment, CommentBuilder> {
  // fields go here
  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'food_id')
  int get foodId;
  @nullable
  Food get food;

  @nullable
  @BuiltValueField(wireName: 'customer_id')
  int get customerId;
  @nullable
  Customer get customer;

  @nullable
  String get comment;
  @nullable
  DateTime get date;

  Comment._();

  factory Comment([updates(CommentBuilder b)]) = _$Comment;

  String toJson() {
    return jsonEncode(serializers.serializeWith(Comment.serializer, this));
  }

  static Comment fromJson(String jsonString) {
    return serializers.deserializeWith(
        Comment.serializer, jsonDecode(jsonString));
  }

  static Serializer<Comment> get serializer => _$commentSerializer;
}
