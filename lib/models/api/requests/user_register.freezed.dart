// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegisterModel _$UserRegisterModelFromJson(Map<String, dynamic> json) {
  return _UserRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterModel {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegisterModelCopyWith<UserRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterModelCopyWith<$Res> {
  factory $UserRegisterModelCopyWith(
          UserRegisterModel value, $Res Function(UserRegisterModel) then) =
      _$UserRegisterModelCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      String birthDate,
      String email,
      String password});
}

/// @nodoc
class _$UserRegisterModelCopyWithImpl<$Res>
    implements $UserRegisterModelCopyWith<$Res> {
  _$UserRegisterModelCopyWithImpl(this._value, this._then);

  final UserRegisterModel _value;
  // ignore: unused_field
  final $Res Function(UserRegisterModel) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserRegisterModelCopyWith<$Res>
    implements $UserRegisterModelCopyWith<$Res> {
  factory _$$_UserRegisterModelCopyWith(_$_UserRegisterModel value,
          $Res Function(_$_UserRegisterModel) then) =
      __$$_UserRegisterModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      String birthDate,
      String email,
      String password});
}

/// @nodoc
class __$$_UserRegisterModelCopyWithImpl<$Res>
    extends _$UserRegisterModelCopyWithImpl<$Res>
    implements _$$_UserRegisterModelCopyWith<$Res> {
  __$$_UserRegisterModelCopyWithImpl(
      _$_UserRegisterModel _value, $Res Function(_$_UserRegisterModel) _then)
      : super(_value, (v) => _then(v as _$_UserRegisterModel));

  @override
  _$_UserRegisterModel get _value => super._value as _$_UserRegisterModel;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_UserRegisterModel(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: birthDate == freezed
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$_UserRegisterModel implements _UserRegisterModel {
  const _$_UserRegisterModel(
      {required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.email,
      required this.password});

  factory _$_UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserRegisterModelFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String birthDate;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserRegisterModel(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegisterModel &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_UserRegisterModelCopyWith<_$_UserRegisterModel> get copyWith =>
      __$$_UserRegisterModelCopyWithImpl<_$_UserRegisterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRegisterModelToJson(this);
  }
}

abstract class _UserRegisterModel implements UserRegisterModel {
  const factory _UserRegisterModel(
      {required final String firstName,
      required final String lastName,
      required final String birthDate,
      required final String email,
      required final String password}) = _$_UserRegisterModel;

  factory _UserRegisterModel.fromJson(Map<String, dynamic> json) =
      _$_UserRegisterModel.fromJson;

  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get birthDate => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegisterModelCopyWith<_$_UserRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
