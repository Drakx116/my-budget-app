// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OperationListModel _$$_OperationListModelFromJson(
        Map<String, dynamic> json) =>
    _$_OperationListModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => OperationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OperationListModelToJson(
        _$_OperationListModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
