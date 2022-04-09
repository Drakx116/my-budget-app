import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_budget_app/models/api/requests/user_login.dart';
import 'package:my_budget_app/models/api/requests/user_register.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIService
{
  final Dio dio;
  String? apiUri = dotenv.env['API_URL'] ?? '';

  APIService(this.dio);

  Future login({ required UserLoginModel credentials }) async {
    var response = await dio.post('$apiUri/auth/login',
        options: Options(headers: { 'Content-Type': 'application/json' }),
        data: credentials.toJson()
    );

    if (response.statusCode != 200) {
      return;
    }

    final json = jsonDecode(response.toString());
    final String token = json['token'];

    return token;
  }

  Future register(UserRegisterModel user) async {
    return await dio.post('$apiUri/auth/register', data: user.toJson());
  }
}