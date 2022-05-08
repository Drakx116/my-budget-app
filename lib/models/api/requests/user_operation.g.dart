// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserOperationModel _$$_UserOperationModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserOperationModel(
      type: json['type'] as String,
      method: json['method'] as String,
      amount: json['amount'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$_UserOperationModelToJson(
        _$_UserOperationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'method': instance.method,
      'amount': instance.amount,
      'label': instance.label,
    };
