// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) {
  return _UserLoginModel.fromJson(json);
}

/// @nodoc
class _$UserLoginModelTearOff {
  const _$UserLoginModelTearOff();

  _UserLoginModel call({required String username, required String password}) {
    return _UserLoginModel(
      username: username,
      password: password,
    );
  }

  UserLoginModel fromJson(Map<String, Object?> json) {
    return UserLoginModel.fromJson(json);
  }
}

/// @nodoc
const $UserLoginModel = _$UserLoginModelTearOff();

/// @nodoc
mixin _$UserLoginModel {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoginModelCopyWith<UserLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginModelCopyWith<$Res> {
  factory $UserLoginModelCopyWith(
          UserLoginModel value, $Res Function(UserLoginModel) then) =
      _$UserLoginModelCopyWithImpl<$Res>;
  $Res call({String username, String password});
}

/// @nodoc
class _$UserLoginModelCopyWithImpl<$Res>
    implements $UserLoginModelCopyWith<$Res> {
  _$UserLoginModelCopyWithImpl(this._value, this._then);

  final UserLoginModel _value;
  // ignore: unused_field
  final $Res Function(UserLoginModel) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserLoginModelCopyWith<$Res>
    implements $UserLoginModelCopyWith<$Res> {
  factory _$UserLoginModelCopyWith(
          _UserLoginModel value, $Res Function(_UserLoginModel) then) =
      __$UserLoginModelCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password});
}

/// @nodoc
class __$UserLoginModelCopyWithImpl<$Res>
    extends _$UserLoginModelCopyWithImpl<$Res>
    implements _$UserLoginModelCopyWith<$Res> {
  __$UserLoginModelCopyWithImpl(
      _UserLoginModel _value, $Res Function(_UserLoginModel) _then)
      : super(_value, (v) => _then(v as _UserLoginModel));

  @override
  _UserLoginModel get _value => super._value as _UserLoginModel;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_UserLoginModel(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLoginModel implements _UserLoginModel {
  const _$_UserLoginModel({required this.username, required this.password});

  factory _$_UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserLoginModelFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'UserLoginModel(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserLoginModel &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$UserLoginModelCopyWith<_UserLoginModel> get copyWith =>
      __$UserLoginModelCopyWithImpl<_UserLoginModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLoginModelToJson(this);
  }
}

abstract class _UserLoginModel implements UserLoginModel {
  const factory _UserLoginModel(
      {required String username, required String password}) = _$_UserLoginModel;

  factory _UserLoginModel.fromJson(Map<String, dynamic> json) =
      _$_UserLoginModel.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$UserLoginModelCopyWith<_UserLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}
