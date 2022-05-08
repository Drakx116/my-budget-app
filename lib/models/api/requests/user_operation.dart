import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_operation.g.dart';
part 'user_operation.freezed.dart';

@Freezed()
class UserOperationModel with _$UserOperationModel
{
  const factory UserOperationModel({
    required String type,
    required String method,
    required String amount,
    required String label,
  }) = _UserOperationModel;

  factory UserOperationModel.fromJson(Map<String, dynamic> json) =>
      _$UserOperationModelFromJson(json);
}