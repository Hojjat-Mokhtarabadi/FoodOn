library comment_food;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'comment_view.g.dart';

abstract class CommentView implements Built<CommentView, CommentViewBuilder> {
  // fields go here
  int get id;
  String get fname;
  String get lname;
  @nullable
  String get comment;
  @nullable
  int get score;
  DateTime get date;

  CommentView._();

  factory CommentView([updates(CommentViewBuilder b)]) = _$CommentView;

  String toJson() {
    return jsonEncode(serializers.serializeWith(CommentView.serializer, this));
  }

  static CommentView fromJson(String jsonString) {
    return serializers.deserializeWith(
        CommentView.serializer, jsonDecode(jsonString));
  }

  static Serializer<CommentView> get serializer => _$commentViewSerializer;
}
