import 'dart:convert';

import 'package:conectadas_app/utils/base_url.dart';
import 'package:conectadas_app/utils/model_ads.dart';
import 'package:http/http.dart' as http;

class AdService {

  // Cria um novo anúncio
  Future<Ad?> createAds(Ad ad) async {
    final response = await http.post(
      Uri.parse('${BaseUrl.baseUrl}/ads/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ad.toJson()),
    );
    if (response.statusCode == 201) {
      return Ad.fromJson(jsonDecode(response.body));
    } else {
      print('Erro ao criar anúncio: ${response.body}');
      return null;
    }
  }

  // Retorna todos os anúncios
  Future<List<dynamic>> getAds() async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/ads/list'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar anúncios');
    }
  }

  //retorna um anúncio por ID
  Future<Ad> getAdById(int id) async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/ads/list/$id'));
    if (response.statusCode == 200) {
      return Ad.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ad');
    }
  }

}