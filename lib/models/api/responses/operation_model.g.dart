// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OperationModel _$$_OperationModelFromJson(Map<String, dynamic> json) =>
    _$_OperationModel(
      type: json['type'] as String,
      amount: json['amount'] as num,
      label: json['label'] as String,
      method: json['method'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_OperationModelToJson(_$_OperationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'label': instance.label,
      'method': instance.method,
      'date': instance.date,
    };
