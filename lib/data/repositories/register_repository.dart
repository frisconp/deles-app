import 'dart:convert';

import 'package:delesapp/data/models/register_result_model.dart';
import 'package:delesapp/res/api_url_list.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRepository {
  Future<RegisterResult> createAccount(Map<String, dynamic> data);
}

class RegisterRepositoryList implements RegisterRepository {
  @override
  Future<RegisterResult> createAccount(Map<String, dynamic> data) async {
    var response = await http.post(ApiUrlList.createAccount, body: data);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return RegisterResult.fromJson(jsonData);
    } else {
      RegisterResult result = RegisterResult();
      result.success = jsonData['success'];
      result.user = null;
      result.message = jsonData['message'];
      return result;
    }
  }
}