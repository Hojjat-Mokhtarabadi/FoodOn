// GENERATED CODE - DO NOT MODIFY BY HAND

part of comment_food;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentView> _$commentViewSerializer = new _$CommentViewSerializer();

class _$CommentViewSerializer implements StructuredSerializer<CommentView> {
  @override
  final Iterable<Type> types = const [CommentView, _$CommentView];
  @override
  final String wireName = 'CommentView';

  @override
  Iterable<Object> serialize(Serializers serializers, CommentView object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'fname',
      serializers.serialize(object.fname,
          specifiedType: const FullType(String)),
      'lname',
      serializers.serialize(object.lname,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
    ];
    Object value;
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.score;
    if (value != null) {
      result
        ..add('score')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CommentView deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentViewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fname':
          result.fname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lname':
          result.lname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$CommentView extends CommentView {
  @override
  final int id;
  @override
  final String fname;
  @override
  final String lname;
  @override
  final String comment;
  @override
  final int score;
  @override
  final DateTime date;

  factory _$CommentView([void Function(CommentViewBuilder) updates]) =>
      (new CommentViewBuilder()..update(updates)).build();

  _$CommentView._(
      {this.id, this.fname, this.lname, this.comment, this.score, this.date})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'CommentView', 'id');
    BuiltValueNullFieldError.checkNotNull(fname, 'CommentView', 'fname');
    BuiltValueNullFieldError.checkNotNull(lname, 'CommentView', 'lname');
    BuiltValueNullFieldError.checkNotNull(date, 'CommentView', 'date');
  }

  @override
  CommentView rebuild(void Function(CommentViewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentViewBuilder toBuilder() => new CommentViewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentView &&
        id == other.id &&
        fname == other.fname &&
        lname == other.lname &&
        comment == other.comment &&
        score == other.score &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), fname.hashCode), lname.hashCode),
                comment.hashCode),
            score.hashCode),
        date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentView')
          ..add('id', id)
          ..add('fname', fname)
          ..add('lname', lname)
          ..add('comment', comment)
          ..add('score', score)
          ..add('date', date))
        .toString();
  }
}

class CommentViewBuilder implements Builder<CommentView, CommentViewBuilder> {
  _$CommentView _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _fname;
  String get fname => _$this._fname;
  set fname(String fname) => _$this._fname = fname;

  String _lname;
  String get lname => _$this._lname;
  set lname(String lname) => _$this._lname = lname;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  CommentViewBuilder();

  CommentViewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fname = $v.fname;
      _lname = $v.lname;
      _comment = $v.comment;
      _score = $v.score;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentView other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentView;
  }

  @override
  void update(void Function(CommentViewBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentView build() {
    final _$result = _$v ??
        new _$CommentView._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'CommentView', 'id'),
            fname: BuiltValueNullFieldError.checkNotNull(
                fname, 'CommentView', 'fname'),
            lname: BuiltValueNullFieldError.checkNotNull(
                lname, 'CommentView', 'lname'),
            comment: comment,
            score: score,
            date: BuiltValueNullFieldError.checkNotNull(
                date, 'CommentView', 'date'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
