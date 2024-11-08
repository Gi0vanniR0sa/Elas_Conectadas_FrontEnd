import 'dart:convert';

import 'package:conectadas_app/utils/base_url.dart';
import 'package:conectadas_app/utils/model_user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  //faz o login do usuario
  Future<bool> signIn(String email, String password) async {
    try{
      final response = await http.post(
      Uri.parse('${BaseUrl.baseUrl}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),);

      if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      logError(response);
      return false;
    }
    }catch (e) {
      print('Erro de conexão: $e');
      throw Exception('Erro ao conectar ao servidor');
    }
  }

  //faz o registro do usuario
  Future<bool> signUp(String email, String name, String password, String phone, String dob) async {
    User user = User(email, name, password, phone, dob, "USER");
    final response = await http.post(
      Uri.parse('${BaseUrl.baseUrl}/users/register'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(user.toJson()),
    );
    return response.statusCode == 201;
  }

  /////// TODO
  
  /// **VERIFICAR SE A RESPOSTA FOI BEM-SUCEDIDA**
  bool isSuccessful(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
  /// **LOGAR ERRO DA REQUISIÇÃO**
  void logError(http.Response response) {
    print('Erro ${response.statusCode}: ${response.reasonPhrase}');
  }

  static const _userIdKey = 'userId';
  static const _userRoleKey = 'userRole';
  static const _userTokenKey = 'access_token';

  // Salvar dados do usuário
  static Future<void> saveUserData(String userId, String role, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_userRoleKey, role);
    await prefs.setString(_userTokenKey, token);
  }

  // Obter o ID do usuário
  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  // Obter o role do usuário
  static Future<String?> getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRoleKey);
  }

  // Obter o token do usuário
  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey);
  }

  // Remover dados do usuário (logout)
  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_userRoleKey);
    await prefs.remove(_userTokenKey);
    
  }

  // Verificar se o usuário está logado
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userTokenKey);
  }
}