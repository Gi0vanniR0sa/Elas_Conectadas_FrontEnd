import 'dart:convert';

// Função de conversão de JSON para objeto
RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  String? message; // NOVO: campo para armazenar a mensagem da API
  int? id;
  String? email;
  String? name;
  String? phone;
  String? dob;
  String? occupation;
  String? location;
  String? bio;
  String? pfp;
  String? role;
  String? accountStatus;

  RegisterResponseModel({
    this.message, // adicionado ao construtor
    this.id,
    this.email,
    this.name,
    this.phone,
    this.dob,
    this.occupation,
    this.location,
    this.bio,
    this.pfp,
    this.role,
    this.accountStatus,
  });

  // Construtor que cria o objeto a partir de um JSON
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'], // captura a mensagem da API
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      dob: json['dob'],
      occupation: json['occupation'],
      location: json['location'],
      bio: json['bio'],
      pfp: json['pfp'],
      role: json['role'],
      accountStatus: json['accountStatus'],
    );
  }

  // Converte o objeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message, // adiciona ao JSON
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'dob': dob,
      'occupation': occupation,
      'location': location,
      'bio': bio,
      'pfp': pfp,
      'role': role,
      'accountStatus': accountStatus,
    };
  }
}
