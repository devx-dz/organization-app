// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UpdateUserCopyWith<$Res> {
  factory _$$_UpdateUserCopyWith(
          _$_UpdateUser value, $Res Function(_$_UpdateUser) then) =
      __$$_UpdateUserCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$_UpdateUserCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_UpdateUser>
    implements _$$_UpdateUserCopyWith<$Res> {
  __$$_UpdateUserCopyWithImpl(
      _$_UpdateUser _value, $Res Function(_$_UpdateUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_UpdateUser(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_UpdateUser with DiagnosticableTreeMixin implements _UpdateUser {
  const _$_UpdateUser(final Map<String, dynamic> data) : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.updateUser(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.updateUser'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUser &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserCopyWith<_$_UpdateUser> get copyWith =>
      __$$_UpdateUserCopyWithImpl<_$_UpdateUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) {
    return updateUser(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) {
    return updateUser?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UpdateUser implements UserEvent {
  const factory _UpdateUser(final Map<String, dynamic> data) = _$_UpdateUser;

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$_UpdateUserCopyWith<_$_UpdateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateUserImageCopyWith<$Res> {
  factory _$$_UpdateUserImageCopyWith(
          _$_UpdateUserImage value, $Res Function(_$_UpdateUserImage) then) =
      __$$_UpdateUserImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$_UpdateUserImageCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_UpdateUserImage>
    implements _$$_UpdateUserImageCopyWith<$Res> {
  __$$_UpdateUserImageCopyWithImpl(
      _$_UpdateUserImage _value, $Res Function(_$_UpdateUserImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$_UpdateUserImage(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateUserImage
    with DiagnosticableTreeMixin
    implements _UpdateUserImage {
  const _$_UpdateUserImage(this.path);

  @override
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.updateUserImage(path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.updateUserImage'))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserImage &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserImageCopyWith<_$_UpdateUserImage> get copyWith =>
      __$$_UpdateUserImageCopyWithImpl<_$_UpdateUserImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) {
    return updateUserImage(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) {
    return updateUserImage?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) {
    if (updateUserImage != null) {
      return updateUserImage(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) {
    return updateUserImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) {
    return updateUserImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) {
    if (updateUserImage != null) {
      return updateUserImage(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserImage implements UserEvent {
  const factory _UpdateUserImage(final String path) = _$_UpdateUserImage;

  String get path;
  @JsonKey(ignore: true)
  _$$_UpdateUserImageCopyWith<_$_UpdateUserImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateUserPasswordCopyWith<$Res> {
  factory _$$_UpdateUserPasswordCopyWith(_$_UpdateUserPassword value,
          $Res Function(_$_UpdateUserPassword) then) =
      __$$_UpdateUserPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldpassword, String newpassword});
}

/// @nodoc
class __$$_UpdateUserPasswordCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_UpdateUserPassword>
    implements _$$_UpdateUserPasswordCopyWith<$Res> {
  __$$_UpdateUserPasswordCopyWithImpl(
      _$_UpdateUserPassword _value, $Res Function(_$_UpdateUserPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldpassword = null,
    Object? newpassword = null,
  }) {
    return _then(_$_UpdateUserPassword(
      null == oldpassword
          ? _value.oldpassword
          : oldpassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == newpassword
          ? _value.newpassword
          : newpassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateUserPassword
    with DiagnosticableTreeMixin
    implements _UpdateUserPassword {
  const _$_UpdateUserPassword(this.oldpassword, this.newpassword);

  @override
  final String oldpassword;
  @override
  final String newpassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.updateUserPassword(oldpassword: $oldpassword, newpassword: $newpassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.updateUserPassword'))
      ..add(DiagnosticsProperty('oldpassword', oldpassword))
      ..add(DiagnosticsProperty('newpassword', newpassword));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserPassword &&
            (identical(other.oldpassword, oldpassword) ||
                other.oldpassword == oldpassword) &&
            (identical(other.newpassword, newpassword) ||
                other.newpassword == newpassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldpassword, newpassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserPasswordCopyWith<_$_UpdateUserPassword> get copyWith =>
      __$$_UpdateUserPasswordCopyWithImpl<_$_UpdateUserPassword>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) {
    return updateUserPassword(oldpassword, newpassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) {
    return updateUserPassword?.call(oldpassword, newpassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) {
    if (updateUserPassword != null) {
      return updateUserPassword(oldpassword, newpassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) {
    return updateUserPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) {
    return updateUserPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) {
    if (updateUserPassword != null) {
      return updateUserPassword(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserPassword implements UserEvent {
  const factory _UpdateUserPassword(
          final String oldpassword, final String newpassword) =
      _$_UpdateUserPassword;

  String get oldpassword;
  String get newpassword;
  @JsonKey(ignore: true)
  _$$_UpdateUserPasswordCopyWith<_$_UpdateUserPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendFeedbackCopyWith<$Res> {
  factory _$$_SendFeedbackCopyWith(
          _$_SendFeedback value, $Res Function(_$_SendFeedback) then) =
      __$$_SendFeedbackCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$_SendFeedbackCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_SendFeedback>
    implements _$$_SendFeedbackCopyWith<$Res> {
  __$$_SendFeedbackCopyWithImpl(
      _$_SendFeedback _value, $Res Function(_$_SendFeedback) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$_SendFeedback(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendFeedback with DiagnosticableTreeMixin implements _SendFeedback {
  const _$_SendFeedback(this.feedback);

  @override
  final String feedback;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.sendFeedback(feedback: $feedback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.sendFeedback'))
      ..add(DiagnosticsProperty('feedback', feedback));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendFeedback &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendFeedbackCopyWith<_$_SendFeedback> get copyWith =>
      __$$_SendFeedbackCopyWithImpl<_$_SendFeedback>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) {
    return sendFeedback(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) {
    return sendFeedback?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) {
    if (sendFeedback != null) {
      return sendFeedback(feedback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) {
    return sendFeedback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) {
    return sendFeedback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) {
    if (sendFeedback != null) {
      return sendFeedback(this);
    }
    return orElse();
  }
}

abstract class _SendFeedback implements UserEvent {
  const factory _SendFeedback(final String feedback) = _$_SendFeedback;

  String get feedback;
  @JsonKey(ignore: true)
  _$$_SendFeedbackCopyWith<_$_SendFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmiteOrganizerCopyWith<$Res> {
  factory _$$_SubmiteOrganizerCopyWith(
          _$_SubmiteOrganizer value, $Res Function(_$_SubmiteOrganizer) then) =
      __$$_SubmiteOrganizerCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String motivation});
}

/// @nodoc
class __$$_SubmiteOrganizerCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_SubmiteOrganizer>
    implements _$$_SubmiteOrganizerCopyWith<$Res> {
  __$$_SubmiteOrganizerCopyWithImpl(
      _$_SubmiteOrganizer _value, $Res Function(_$_SubmiteOrganizer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? motivation = null,
  }) {
    return _then(_$_SubmiteOrganizer(
      null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      null == motivation
          ? _value.motivation
          : motivation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmiteOrganizer
    with DiagnosticableTreeMixin
    implements _SubmiteOrganizer {
  const _$_SubmiteOrganizer(this.eventId, this.motivation);

  @override
  final String eventId;
  @override
  final String motivation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.submiteOrganizer(eventId: $eventId, motivation: $motivation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.submiteOrganizer'))
      ..add(DiagnosticsProperty('eventId', eventId))
      ..add(DiagnosticsProperty('motivation', motivation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmiteOrganizer &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.motivation, motivation) ||
                other.motivation == motivation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, motivation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmiteOrganizerCopyWith<_$_SubmiteOrganizer> get copyWith =>
      __$$_SubmiteOrganizerCopyWithImpl<_$_SubmiteOrganizer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) {
    return submiteOrganizer(eventId, motivation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) {
    return submiteOrganizer?.call(eventId, motivation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) {
    if (submiteOrganizer != null) {
      return submiteOrganizer(eventId, motivation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) {
    return submiteOrganizer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) {
    return submiteOrganizer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) {
    if (submiteOrganizer != null) {
      return submiteOrganizer(this);
    }
    return orElse();
  }
}

abstract class _SubmiteOrganizer implements UserEvent {
  const factory _SubmiteOrganizer(
      final String eventId, final String motivation) = _$_SubmiteOrganizer;

  String get eventId;
  String get motivation;
  @JsonKey(ignore: true)
  _$$_SubmiteOrganizerCopyWith<_$_SubmiteOrganizer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendReportCopyWith<$Res> {
  factory _$$_SendReportCopyWith(
          _$_SendReport value, $Res Function(_$_SendReport) then) =
      __$$_SendReportCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? image});
}

/// @nodoc
class __$$_SendReportCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_SendReport>
    implements _$$_SendReportCopyWith<$Res> {
  __$$_SendReportCopyWithImpl(
      _$_SendReport _value, $Res Function(_$_SendReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? image = freezed,
  }) {
    return _then(_$_SendReport(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SendReport with DiagnosticableTreeMixin implements _SendReport {
  const _$_SendReport(this.message, this.image);

  @override
  final String message;
  @override
  final String? image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.sendReport(message: $message, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.sendReport'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendReport &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendReportCopyWith<_$_SendReport> get copyWith =>
      __$$_SendReportCopyWithImpl<_$_SendReport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) updateUser,
    required TResult Function(String path) updateUserImage,
    required TResult Function(String oldpassword, String newpassword)
        updateUserPassword,
    required TResult Function(String feedback) sendFeedback,
    required TResult Function(String eventId, String motivation)
        submiteOrganizer,
    required TResult Function(String message, String? image) sendReport,
  }) {
    return sendReport(message, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? updateUser,
    TResult? Function(String path)? updateUserImage,
    TResult? Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult? Function(String feedback)? sendFeedback,
    TResult? Function(String eventId, String motivation)? submiteOrganizer,
    TResult? Function(String message, String? image)? sendReport,
  }) {
    return sendReport?.call(message, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? updateUser,
    TResult Function(String path)? updateUserImage,
    TResult Function(String oldpassword, String newpassword)?
        updateUserPassword,
    TResult Function(String feedback)? sendFeedback,
    TResult Function(String eventId, String motivation)? submiteOrganizer,
    TResult Function(String message, String? image)? sendReport,
    required TResult orElse(),
  }) {
    if (sendReport != null) {
      return sendReport(message, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_UpdateUserImage value) updateUserImage,
    required TResult Function(_UpdateUserPassword value) updateUserPassword,
    required TResult Function(_SendFeedback value) sendFeedback,
    required TResult Function(_SubmiteOrganizer value) submiteOrganizer,
    required TResult Function(_SendReport value) sendReport,
  }) {
    return sendReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_UpdateUserImage value)? updateUserImage,
    TResult? Function(_UpdateUserPassword value)? updateUserPassword,
    TResult? Function(_SendFeedback value)? sendFeedback,
    TResult? Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult? Function(_SendReport value)? sendReport,
  }) {
    return sendReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_UpdateUserImage value)? updateUserImage,
    TResult Function(_UpdateUserPassword value)? updateUserPassword,
    TResult Function(_SendFeedback value)? sendFeedback,
    TResult Function(_SubmiteOrganizer value)? submiteOrganizer,
    TResult Function(_SendReport value)? sendReport,
    required TResult orElse(),
  }) {
    if (sendReport != null) {
      return sendReport(this);
    }
    return orElse();
  }
}

abstract class _SendReport implements UserEvent {
  const factory _SendReport(final String message, final String? image) =
      _$_SendReport;

  String get message;
  String? get image;
  @JsonKey(ignore: true)
  _$$_SendReportCopyWith<_$_SendReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success with DiagnosticableTreeMixin implements _Success {
  const _$_Success();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserState.success'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements UserState {
  const factory _Success() = _$_Success;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Failure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure with DiagnosticableTreeMixin implements _Failure {
  const _$_Failure(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserState.failure(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserState.failure'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements UserState {
  const factory _Failure(final String message) = _$_Failure;

  String get message;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
