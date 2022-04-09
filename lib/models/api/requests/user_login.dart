import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login.g.dart';
part 'user_login.freezed.dart';

@Freezed()
class UserLoginModel with _$UserLoginModel
{
  const factory UserLoginModel({
    required String username,
    required String password,
  }) = _UserLoginModel;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);
}