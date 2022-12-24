// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

class UserResponse {
  UserResponse({
    this.result,
    this.data,
    this.message,
  });

  final int? result;
  final UserModel? data;
  final String? message;

  UserResponse copyWith({
    int? result,
    UserModel? data,
    String? message,
  }) =>
      UserResponse(
        result: result ?? this.result,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory UserResponse.fromRawJson(String str) =>
      UserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        result: json["result"] == null ? null : json["result"]!,
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"]!,
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result!,
        "data": data == null ? null : data!.toJson(),
        "message": message == null ? null : message!,
      };
}

class UserModel {
  UserModel({
    this.email,
    this.name,
    this.phone,
    this.userGroup,
    this.registerDate,
    this.token,
  });

  final String? email;
  final String? name;
  final String? phone;
  final int? userGroup;
  final DateTime? registerDate;
  final String? token;

  UserModel copyWith({
    String? email,
    String? name,
    String? phone,
    int? userGroup,
    DateTime? registerDate,
    String? token,
  }) =>
      UserModel(
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        userGroup: userGroup ?? this.userGroup,
        registerDate: registerDate ?? this.registerDate,
        token: token ?? this.token,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"] == null ? null : json["email"]!,
        name: json["name"] == null ? null : json["name"]!,
        phone: json["phone"] == null ? null : json["phone"]!,
        userGroup: json["userGroup"] == null ? null : json["userGroup"]!,
        registerDate: json["registerDate"] == null
            ? null
            : DateTime.parse(json["registerDate"]),
        token: json["token"] == null ? null : json["token"]!,
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email!,
        "name": name == null ? null : name!,
        "phone": phone == null ? null : phone!,
        "userGroup": userGroup == null ? null : userGroup!,
        "registerDate":
            registerDate == null ? null : registerDate!.toIso8601String(),
        "token": token == null ? null : token!,
      };
}
