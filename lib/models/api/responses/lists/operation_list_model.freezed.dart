// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'operation_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OperationListModel _$OperationListModelFromJson(Map<String, dynamic> json) {
  return _OperationListModel.fromJson(json);
}

/// @nodoc
mixin _$OperationListModel {
  List<OperationModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperationListModelCopyWith<OperationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationListModelCopyWith<$Res> {
  factory $OperationListModelCopyWith(
          OperationListModel value, $Res Function(OperationListModel) then) =
      _$OperationListModelCopyWithImpl<$Res>;
  $Res call({List<OperationModel> results});
}

/// @nodoc
class _$OperationListModelCopyWithImpl<$Res>
    implements $OperationListModelCopyWith<$Res> {
  _$OperationListModelCopyWithImpl(this._value, this._then);

  final OperationListModel _value;
  // ignore: unused_field
  final $Res Function(OperationListModel) _then;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<OperationModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_OperationListModelCopyWith<$Res>
    implements $OperationListModelCopyWith<$Res> {
  factory _$$_OperationListModelCopyWith(_$_OperationListModel value,
          $Res Function(_$_OperationListModel) then) =
      __$$_OperationListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<OperationModel> results});
}

/// @nodoc
class __$$_OperationListModelCopyWithImpl<$Res>
    extends _$OperationListModelCopyWithImpl<$Res>
    implements _$$_OperationListModelCopyWith<$Res> {
  __$$_OperationListModelCopyWithImpl(
      _$_OperationListModel _value, $Res Function(_$_OperationListModel) _then)
      : super(_value, (v) => _then(v as _$_OperationListModel));

  @override
  _$_OperationListModel get _value => super._value as _$_OperationListModel;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$_OperationListModel(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<OperationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OperationListModel implements _OperationListModel {
  const _$_OperationListModel({required final List<OperationModel> results})
      : _results = results;

  factory _$_OperationListModel.fromJson(Map<String, dynamic> json) =>
      _$$_OperationListModelFromJson(json);

  final List<OperationModel> _results;
  @override
  List<OperationModel> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'OperationListModel(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OperationListModel &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_OperationListModelCopyWith<_$_OperationListModel> get copyWith =>
      __$$_OperationListModelCopyWithImpl<_$_OperationListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OperationListModelToJson(this);
  }
}

abstract class _OperationListModel implements OperationListModel {
  const factory _OperationListModel(
      {required final List<OperationModel> results}) = _$_OperationListModel;

  factory _OperationListModel.fromJson(Map<String, dynamic> json) =
      _$_OperationListModel.fromJson;

  @override
  List<OperationModel> get results => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OperationListModelCopyWith<_$_OperationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
