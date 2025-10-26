import 'dart:convert';

RegisterRequestModel registerRequestModel(String str) => RegisterRequestModel.fromJson(json.decode(str));

class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? phone;   
  String? dob;

  RegisterRequestModel(
      {
        required this.name, 
        required this.email, 
        required this.password, 
        required this.phone, 
        required this.dob
        }
      );

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    return data;
  }
}