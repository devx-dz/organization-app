// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notif _$NotifFromJson(Map<String, dynamic> json) {
  return _Notif.fromJson(json);
}

/// @nodoc
mixin _$Notif {
  bool get read => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotifCopyWith<Notif> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifCopyWith<$Res> {
  factory $NotifCopyWith(Notif value, $Res Function(Notif) then) =
      _$NotifCopyWithImpl<$Res, Notif>;
  @useResult
  $Res call({bool read, String title, String body});
}

/// @nodoc
class _$NotifCopyWithImpl<$Res, $Val extends Notif>
    implements $NotifCopyWith<$Res> {
  _$NotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? read = null,
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotifCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory _$$_NotifCopyWith(_$_Notif value, $Res Function(_$_Notif) then) =
      __$$_NotifCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool read, String title, String body});
}

/// @nodoc
class __$$_NotifCopyWithImpl<$Res> extends _$NotifCopyWithImpl<$Res, _$_Notif>
    implements _$$_NotifCopyWith<$Res> {
  __$$_NotifCopyWithImpl(_$_Notif _value, $Res Function(_$_Notif) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? read = null,
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$_Notif(
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notif implements _Notif {
  _$_Notif({required this.read, required this.title, required this.body});

  factory _$_Notif.fromJson(Map<String, dynamic> json) =>
      _$$_NotifFromJson(json);

  @override
  final bool read;
  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'Notif(read: $read, title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notif &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, read, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotifCopyWith<_$_Notif> get copyWith =>
      __$$_NotifCopyWithImpl<_$_Notif>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotifToJson(
      this,
    );
  }
}

abstract class _Notif implements Notif {
  factory _Notif(
      {required final bool read,
      required final String title,
      required final String body}) = _$_Notif;

  factory _Notif.fromJson(Map<String, dynamic> json) = _$_Notif.fromJson;

  @override
  bool get read;
  @override
  String get title;
  @override
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_NotifCopyWith<_$_Notif> get copyWith =>
      throw _privateConstructorUsedError;
}
