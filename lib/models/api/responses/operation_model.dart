import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

@freezed
class OperationModel with _$OperationModel {
  const factory OperationModel({
    required String type,
    required num amount,
    required String label,
    required String method,
    required String date
  }) = _OperationModel;

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);
}
