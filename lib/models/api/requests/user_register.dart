import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register.g.dart';
part 'user_register.freezed.dart';

@Freezed()
class UserRegisterModel with _$UserRegisterModel
{
  const factory UserRegisterModel({
    required String firstName,
    required String lastName,
    required String birthDate,
    required String email,
    required String password,
  }) = _UserRegisterModel;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterModelFromJson(json);
}