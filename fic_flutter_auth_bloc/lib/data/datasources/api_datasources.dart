import 'package:fic4_flutter_auth_bloc/data/models/request/login_model.dart';
import 'package:fic4_flutter_auth_bloc/data/models/request/register_model.dart';
import 'package:fic4_flutter_auth_bloc/data/models/response/register_response_model.dart';
import 'package:fic4_flutter_auth_bloc/data/models/response/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class ApiDatasource {
  final storage = const FlutterSecureStorage();
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/users/'),
      // headers: {'Content-Type': 'application/json'},
      body: registerModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  Future<void> login(LoginModel loginModel) async {
    final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
        body: loginModel.toMap());
    Tokenmodel x = tokenmodelFromJson(response.body);
    String token = x.accessToken;
    await storage.write(key: 'token', value: token);
  }

  Future<RegisterResponseModel> getDataUser() async {
    String token = await storage.read(key: 'token') ?? '';
    final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  Future<void> logOut() async {
    await storage.delete(key: 'token');
  }
}
