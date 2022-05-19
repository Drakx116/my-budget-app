// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserOperationModel _$UserOperationModelFromJson(Map<String, dynamic> json) {
  return _UserOperationModel.fromJson(json);
}

/// @nodoc
mixin _$UserOperationModel {
  String get type => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserOperationModelCopyWith<UserOperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserOperationModelCopyWith<$Res> {
  factory $UserOperationModelCopyWith(
          UserOperationModel value, $Res Function(UserOperationModel) then) =
      _$UserOperationModelCopyWithImpl<$Res>;
  $Res call({String type, String method, String amount, String label});
}

/// @nodoc
class _$UserOperationModelCopyWithImpl<$Res>
    implements $UserOperationModelCopyWith<$Res> {
  _$UserOperationModelCopyWithImpl(this._value, this._then);

  final UserOperationModel _value;
  // ignore: unused_field
  final $Res Function(UserOperationModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? method = freezed,
    Object? amount = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserOperationModelCopyWith<$Res>
    implements $UserOperationModelCopyWith<$Res> {
  factory _$$_UserOperationModelCopyWith(_$_UserOperationModel value,
          $Res Function(_$_UserOperationModel) then) =
      __$$_UserOperationModelCopyWithImpl<$Res>;
  @override
  $Res call({String type, String method, String amount, String label});
}

/// @nodoc
class __$$_UserOperationModelCopyWithImpl<$Res>
    extends _$UserOperationModelCopyWithImpl<$Res>
    implements _$$_UserOperationModelCopyWith<$Res> {
  __$$_UserOperationModelCopyWithImpl(
      _$_UserOperationModel _value, $Res Function(_$_UserOperationModel) _then)
      : super(_value, (v) => _then(v as _$_UserOperationModel));

  @override
  _$_UserOperationModel get _value => super._value as _$_UserOperationModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? method = freezed,
    Object? amount = freezed,
    Object? label = freezed,
  }) {
    return _then(_$_UserOperationModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserOperationModel implements _UserOperationModel {
  const _$_UserOperationModel(
      {required this.type,
      required this.method,
      required this.amount,
      required this.label});

  factory _$_UserOperationModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserOperationModelFromJson(json);

  @override
  final String type;
  @override
  final String method;
  @override
  final String amount;
  @override
  final String label;

  @override
  String toString() {
    return 'UserOperationModel(type: $type, method: $method, amount: $amount, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserOperationModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.label, label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(label));

  @JsonKey(ignore: true)
  @override
  _$$_UserOperationModelCopyWith<_$_UserOperationModel> get copyWith =>
      __$$_UserOperationModelCopyWithImpl<_$_UserOperationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserOperationModelToJson(this);
  }
}

abstract class _UserOperationModel implements UserOperationModel {
  const factory _UserOperationModel(
      {required final String type,
      required final String method,
      required final String amount,
      required final String label}) = _$_UserOperationModel;

  factory _UserOperationModel.fromJson(Map<String, dynamic> json) =
      _$_UserOperationModel.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get method => throw _privateConstructorUsedError;
  @override
  String get amount => throw _privateConstructorUsedError;
  @override
  String get label => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserOperationModelCopyWith<_$_UserOperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
