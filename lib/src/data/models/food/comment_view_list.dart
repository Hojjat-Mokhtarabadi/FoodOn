library comment_view_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:foodon/src/data/models/food/comment_view.dart';

import '../serializers.dart';

part 'comment_view_list.g.dart';

abstract class CommentViewList
    implements Built<CommentViewList, CommentViewListBuilder> {
  // fields go here
  BuiltList<CommentView> get commentsList;
  bool get alreadyCommented;
  int get commentId;

  CommentViewList._();

  factory CommentViewList([updates(CommentViewListBuilder b)]) =
      _$CommentViewList;

  String toJson() {
    return jsonEncode(
        serializers.serializeWith(CommentViewList.serializer, this));
  }

  static CommentViewList fromJson(String jsonString) {
    return serializers.deserializeWith(
        CommentViewList.serializer, jsonDecode(jsonString));
  }

  static Serializer<CommentViewList> get serializer =>
      _$commentViewListSerializer;
}
