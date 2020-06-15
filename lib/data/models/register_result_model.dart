import 'package:delesapp/data/models/user_model.dart';

class RegisterResult {
  bool success;
  User user;
  String message;

  RegisterResult({this.success, this.user, this.message});

  RegisterResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['data'] != null ? new User.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['data'] = this.user.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}