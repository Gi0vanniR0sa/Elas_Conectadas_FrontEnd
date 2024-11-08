// Usado no Login e Register
class User {
  String email;
  String name;
  String password;
  String phone;
  String dob;
  String role;

  User(this.email, this.name, this.password, this.phone, this.dob, this.role);

  String cleanPhone(String phone) {
    return phone.replaceAll(RegExp(r'[^\d]'), ''); // Remove todos characteres que não são números
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'phone': cleanPhone(phone),
      'dob': dob,
      'role': role,
    };
  }

  // Cria um objeto User a partir de um JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['email'],
      json['name'],
      json['password'],
      json['phone'],
      json['dob'],
      json['role'],
    );
  }
}

/* Usado no Post
import 'dart:typed_data';

enum UserType {
  ADMIN,
  USER,
}

class User {
  int? id;
  String email;
  String password;
  String name;
  String? phone;
  String? dob;
  String? occupation;
  String? location;
  String? bio;
  Uint8List? pfp;
  UserType role;

  User({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    this.phone,
    this.dob,
    this.occupation,
    this.location,
    this.bio,
    this.pfp,
    required this.role,
  });

  String cleanPhone(String phone) {
    return phone.replaceAll(RegExp(r'[^\d]'), ''); // Remove todos characteres que não são números
  }

  // Converter de JSON para User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      dob: json['dob'],
      occupation: json['occupation'],
      location: json['location'],
      bio: json['bio'],
      pfp: json['pfp'] != null ? Uint8List.fromList(List<int>.from(json['pfp'])) : null,
      role: UserType.values.byName(json['role']),
    );
  }

  // Converter de User para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': cleanPhone(phone!),
      'dob': dob,
      'occupation': occupation,
      'location': location,
      'bio': bio,
      'pfp': pfp,
      'role': role.name,
    };
  }
}*/