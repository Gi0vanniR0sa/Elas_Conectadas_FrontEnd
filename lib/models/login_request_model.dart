import 'dart:convert';

LoginRequestModel loginRequestModel(String str) => LoginRequestModel.fromJson(json.decode(str));

// Classes RequestModel representam a estrutura dos dados enviados do seu aplicativo (cliente) para a API
// Seu próposito é converter requisições JSON para um modelo de dados com tipagem
class LoginRequestModel {
  String? email;
  String? password;
  String? otp;

  LoginRequestModel({
    required this.email, 
    required this.password,
    this.otp,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    if (otp != null) data['otp'] = otp;
    return data;
  }
}