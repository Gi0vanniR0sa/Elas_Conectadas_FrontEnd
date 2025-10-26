import 'dart:convert';

LoginResponseModel loginResponseJson(String str) => LoginResponseModel.fromJson(json.decode(str));

class UserModel {
  int? id;
  String? email;
  String? name;
  String? occupation;
  String? location;
  String? bio;
  String? pfp;
  String? role;
  String? accountStatus;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.occupation,
    this.location,
    this.bio,
    this.pfp,
    this.role,
    this.accountStatus,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    occupation = json['occupation'];
    location = json['location'];
    bio = json['bio'];
    pfp = json['pfp'];
    role = json['role'];
    accountStatus = json['accountStatus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    if (occupation != null) data['occupation'] = occupation;
    if (location != null) data['location'] = location;
    if (bio != null) data['bio'] = bio;
    if (pfp != null) data['pfp'] = pfp;
    data['role'] = role;
    data['accountStatus'] = accountStatus;
    return data;
  }
}

class LoginResponseModel {
  String? accessToken;
  UserModel? user;

  LoginResponseModel({this.accessToken, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    if (json['user'] != null) {
      user = UserModel.fromJson(json['user']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (accessToken != null) data['access_token'] = accessToken;
    if (user != null) data['user'] = user!.toJson();
    return data;
  }
}
