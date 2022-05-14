import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_budget_app/models/api/responses/operation_model.dart';

part 'operation_list_model.freezed.dart';
part 'operation_list_model.g.dart';

@freezed
class OperationListModel with _$OperationListModel {
  const factory OperationListModel({
    required List<OperationModel> results
  }) = _OperationListModel;

  factory OperationListModel.fromJson(Map<String, dynamic> json) =>
      _$OperationListModelFromJson(json);
}