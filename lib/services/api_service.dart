import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_budget_app/models/api/requests/user_login.dart';
import 'package:my_budget_app/models/api/requests/user_operation.dart';
import 'package:my_budget_app/models/api/requests/user_register.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_budget_app/models/secured_item_model.dart';
import 'package:my_budget_app/services/secure_storage_service.dart';

class APIService
{
  final Dio dio;
  final SecureStorage storage;
  String? apiUri = dotenv.env['API_URL'] ?? '';

  APIService(this.dio, this.storage);

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

  Future createOperation(UserOperationModel operation) async {
    var token = await _getToken();
    if (null == token) {
      return;
    }

    return await dio.post(
        '$apiUri/operations/create',
        options: Options(headers: { 'Authorization' : 'Bearer ' + token }),
        data: operation.toJson()
    );
  }

  Future getOperationSummary() async {
    var token = await _getToken();
    if (null == token) {
      return;
    }
    
    return await dio.get(
      '$apiUri/operations/summary',
      options: Options(headers: { 'Authorization' : 'Bearer ' + token }),
    );
  }

  Future getLastOperations({ int limit = 0 }) async {
    var token = await _getToken();

    return await dio.get(
      '$apiUri/operations?limit=' + limit.toString(),
      options: Options(headers: { 'Authorization' : 'Bearer ' + token! })
    );
  }

  Future<String?> _getToken() async {
    var response = await storage.get('token');
    return response!.value;
  }
}