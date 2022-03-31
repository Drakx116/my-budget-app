import 'dart:convert';
import 'package:dio/dio.dart';

class APIService
{
  final Dio dio;

  APIService(this.dio);

  Future login({ required String email, required String password }) async {
    var response = await dio.post('http://192.168.0.6:8000/api/auth/login',
        options: Options(headers: {
          'Content-Type': 'application/json'
        }),
        data: jsonEncode({ 'username': email, 'password': password })
    );

    if (response.statusCode != 200) {
      return;
    }

    final json = jsonDecode(response.toString());
    final String token = json['token'];

    return token;
  }
}