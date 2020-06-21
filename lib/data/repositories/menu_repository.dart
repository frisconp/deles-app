import 'dart:convert';

import 'package:delesapp/data/models/menu_model.dart';
import 'package:delesapp/res/api_url_list.dart';
import 'package:http/http.dart' as http;

abstract class MenuRepository {
  Future<List<Menu>> getAll();
}

class MenuRepositoryList implements MenuRepository {
  @override
  Future<List<Menu>> getAll() async {
    var response = await http.get(ApiUrlList.getAllMenus);
    
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> listMenu = (jsonData as Map<String, dynamic>)['data'];
      List<Menu> menus = [];

      for (var i = 0; i < listMenu.length; i++) {
        menus.add(Menu.fromJson(listMenu[i]));
      }

      return menus;
    } else {
      throw Exception();
    }
  }
  
}