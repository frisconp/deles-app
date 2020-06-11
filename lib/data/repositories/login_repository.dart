import 'dart:convert';

import 'package:delesapp/data/models/login_result_model.dart';
import 'package:delesapp/res/api_url_list.dart';
import 'package:http/http.dart' as http;

abstract class LoginRepository {
  Future<LoginResult> loginValidation(Map<String, String> data);
}

class LoginRepositoryList implements LoginRepository {
  @override
  Future<LoginResult> loginValidation(Map<String, String> data) async {
    var response = await http.post(ApiUrlList.validateLogin, body: data);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return LoginResult.fromJson(jsonData);
    } else {
      LoginResult failedResult = LoginResult();
      failedResult.success = false;
      failedResult.data = null;
      failedResult.message = (jsonData as Map<String, dynamic>)['message'];
      return failedResult;
    }
  }
}
