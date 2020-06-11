import 'package:delesapp/data/models/user_model.dart';
import 'package:flutter/material.dart';

class LoginResult {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool success;
  Data data;
  String message;

  LoginResult({this.success, this.data, this.message});

  LoginResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  User user;
  String accessToken;

  Data({this.user, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}
