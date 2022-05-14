// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'operation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OperationModel _$OperationModelFromJson(Map<String, dynamic> json) {
  return _OperationModel.fromJson(json);
}

/// @nodoc
class _$OperationModelTearOff {
  const _$OperationModelTearOff();

  _OperationModel call(
      {required String type,
      required num amount,
      required String label,
      required String method}) {
    return _OperationModel(
      type: type,
      amount: amount,
      label: label,
      method: method,
    );
  }

  OperationModel fromJson(Map<String, Object?> json) {
    return OperationModel.fromJson(json);
  }
}

/// @nodoc
const $OperationModel = _$OperationModelTearOff();

/// @nodoc
mixin _$OperationModel {
  String get type => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationModelCopyWith<OperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationModelCopyWith<$Res> {
  factory $OperationModelCopyWith(
          OperationModel value, $Res Function(OperationModel) then) =
      _$OperationModelCopyWithImpl<$Res>;
  $Res call({String type, num amount, String label, String method});
}

/// @nodoc
class _$OperationModelCopyWithImpl<$Res>
    implements $OperationModelCopyWith<$Res> {
  _$OperationModelCopyWithImpl(this._value, this._then);

  final OperationModel _value;
  // ignore: unused_field
  final $Res Function(OperationModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? label = freezed,
    Object? method = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$OperationModelCopyWith<$Res>
    implements $OperationModelCopyWith<$Res> {
  factory _$OperationModelCopyWith(
          _OperationModel value, $Res Function(_OperationModel) then) =
      __$OperationModelCopyWithImpl<$Res>;
  @override
  $Res call({String type, num amount, String label, String method});
}

/// @nodoc
class __$OperationModelCopyWithImpl<$Res>
    extends _$OperationModelCopyWithImpl<$Res>
    implements _$OperationModelCopyWith<$Res> {
  __$OperationModelCopyWithImpl(
      _OperationModel _value, $Res Function(_OperationModel) _then)
      : super(_value, (v) => _then(v as _OperationModel));

  @override
  _OperationModel get _value => super._value as _OperationModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? label = freezed,
    Object? method = freezed,
  }) {
    return _then(_OperationModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OperationModel implements _OperationModel {
  const _$_OperationModel(
      {required this.type,
      required this.amount,
      required this.label,
      required this.method});

  factory _$_OperationModel.fromJson(Map<String, dynamic> json) =>
      _$$_OperationModelFromJson(json);

  @override
  final String type;
  @override
  final num amount;
  @override
  final String label;
  @override
  final String method;

  @override
  String toString() {
    return 'OperationModel(type: $type, amount: $amount, label: $label, method: $method)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OperationModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.method, method));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(method));

  @JsonKey(ignore: true)
  @override
  _$OperationModelCopyWith<_OperationModel> get copyWith =>
      __$OperationModelCopyWithImpl<_OperationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OperationModelToJson(this);
  }
}

abstract class _OperationModel implements OperationModel {
  const factory _OperationModel(
      {required String type,
      required num amount,
      required String label,
      required String method}) = _$_OperationModel;

  factory _OperationModel.fromJson(Map<String, dynamic> json) =
      _$_OperationModel.fromJson;

  @override
  String get type;
  @override
  num get amount;
  @override
  String get label;
  @override
  String get method;
  @override
  @JsonKey(ignore: true)
  _$OperationModelCopyWith<_OperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
