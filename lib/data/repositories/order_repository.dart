import 'dart:convert';
import 'package:delesapp/res/api_url_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrderRepository {
  Future<Map<String, dynamic>> createNewOrder(Map<String, dynamic> data);
}

class OrderRepositoryList implements OrderRepository {
  @override
  Future<Map<String, dynamic>> createNewOrder(Map<String, dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var response = await http.post(
      ApiUrlList.storeOrder,
      body: jsonEncode({
        "payment_total": data['payment_total'],
        "note": data['note'] ?? null,
        "order_items": data['order_items'],
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + sharedPreferences.getString('token')
      },
    );

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (jsonData as Map<String, dynamic>);
    } else {
      print(response.body);
      return {
        'token': null,
        'paymentUrl': null,
      };
    }
  }
}
