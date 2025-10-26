import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:conectadas_app/models/login_response_model.dart';
import 'package:conectadas_app/models/register_request_model.dart';
import 'package:flutter/material.dart';

// Classe utilizada para gerenciar informações de login armazenadas localmente, usando cache.
// Dessa maneira ela mantém dados como token e informações do usuário. 
class SharedService {

  static Future<bool> isLoggedIn() async {
    // Verifica se há dados em cache a partir da chave "login_details"
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");
    
    // Retorna true se existir um cache armazenado ou false se não existir
    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_details");
    
    if(isKeyExist){
      // Se existir dados em cache armazenados então atribua para cacheData
      var cacheData = await APICacheManager().getCacheData("login_details");

      // Chama a função loginResponseJson que converte texto em um objeto LoginResponseJson
      return loginResponseJson(cacheData.syncData);
    } 

    return null;  

  }

  static Future<void> setLoginDetails(
    LoginResponseModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details", 
      syncData: jsonEncode(model.toJson())
      );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  

  static Future<void> logout() async {
    await APICacheManager().deleteCache("login_details");
  }

  static Future<void> logoutAndRedirect(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");

    // Confirma se o cache foi apagado
    //bool loggedIn = await SharedService.isLoggedIn();
    //print("🔹 Logout concluído, usuário logado? $loggedIn"); // Deve ser false

    Navigator.pushNamedAndRemoveUntil(
      context, 
      '/login', 
      (route) => false, 
      );
  }
}