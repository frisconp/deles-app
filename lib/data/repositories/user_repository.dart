import 'dart:convert';

import 'package:delesapp/data/models/user_model.dart';
import 'package:delesapp/res/api_url_list.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository {
  Future<User> getLoggedInUser(String accessToken);
}

class UserRepositoryList implements UserRepository {
  @override
  Future<User> getLoggedInUser(String accessToken) async {
    var response = await http.get(ApiUrlList.loggedInUser, headers: {
      'Authorization': 'Bearer ' + accessToken,
    });

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var userData = (jsonData as Map<String, dynamic>)['data'];

      return User.fromJson(userData);
    } else {
      throw Exception();
    }
  }
}
