// GENERATED CODE - DO NOT MODIFY BY HAND

part of comment_view_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentViewList> _$commentViewListSerializer =
    new _$CommentViewListSerializer();

class _$CommentViewListSerializer
    implements StructuredSerializer<CommentViewList> {
  @override
  final Iterable<Type> types = const [CommentViewList, _$CommentViewList];
  @override
  final String wireName = 'CommentViewList';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentViewList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'commentsList',
      serializers.serialize(object.commentsList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CommentView)])),
      'alreadyCommented',
      serializers.serialize(object.alreadyCommented,
          specifiedType: const FullType(bool)),
      'commentId',
      serializers.serialize(object.commentId,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  CommentViewList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentViewListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'commentsList':
          result.commentsList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CommentView)]))
              as BuiltList<Object>);
          break;
        case 'alreadyCommented':
          result.alreadyCommented = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'commentId':
          result.commentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentViewList extends CommentViewList {
  @override
  final BuiltList<CommentView> commentsList;
  @override
  final bool alreadyCommented;
  @override
  final int commentId;

  factory _$CommentViewList([void Function(CommentViewListBuilder) updates]) =>
      (new CommentViewListBuilder()..update(updates)).build();

  _$CommentViewList._(
      {this.commentsList, this.alreadyCommented, this.commentId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        commentsList, 'CommentViewList', 'commentsList');
    BuiltValueNullFieldError.checkNotNull(
        alreadyCommented, 'CommentViewList', 'alreadyCommented');
    BuiltValueNullFieldError.checkNotNull(
        commentId, 'CommentViewList', 'commentId');
  }

  @override
  CommentViewList rebuild(void Function(CommentViewListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentViewListBuilder toBuilder() =>
      new CommentViewListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentViewList &&
        commentsList == other.commentsList &&
        alreadyCommented == other.alreadyCommented &&
        commentId == other.commentId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, commentsList.hashCode), alreadyCommented.hashCode),
        commentId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentViewList')
          ..add('commentsList', commentsList)
          ..add('alreadyCommented', alreadyCommented)
          ..add('commentId', commentId))
        .toString();
  }
}

class CommentViewListBuilder
    implements Builder<CommentViewList, CommentViewListBuilder> {
  _$CommentViewList _$v;

  ListBuilder<CommentView> _commentsList;
  ListBuilder<CommentView> get commentsList =>
      _$this._commentsList ??= new ListBuilder<CommentView>();
  set commentsList(ListBuilder<CommentView> commentsList) =>
      _$this._commentsList = commentsList;

  bool _alreadyCommented;
  bool get alreadyCommented => _$this._alreadyCommented;
  set alreadyCommented(bool alreadyCommented) =>
      _$this._alreadyCommented = alreadyCommented;

  int _commentId;
  int get commentId => _$this._commentId;
  set commentId(int commentId) => _$this._commentId = commentId;

  CommentViewListBuilder();

  CommentViewListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _commentsList = $v.commentsList.toBuilder();
      _alreadyCommented = $v.alreadyCommented;
      _commentId = $v.commentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentViewList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentViewList;
  }

  @override
  void update(void Function(CommentViewListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentViewList build() {
    _$CommentViewList _$result;
    try {
      _$result = _$v ??
          new _$CommentViewList._(
              commentsList: commentsList.build(),
              alreadyCommented: BuiltValueNullFieldError.checkNotNull(
                  alreadyCommented, 'CommentViewList', 'alreadyCommented'),
              commentId: BuiltValueNullFieldError.checkNotNull(
                  commentId, 'CommentViewList', 'commentId'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'commentsList';
        commentsList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommentViewList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
