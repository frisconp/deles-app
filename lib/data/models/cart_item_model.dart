import 'package:delesapp/data/models/menu_model.dart';

class CartItem {
  Menu menu;
  int amount;

  CartItem({
    this.menu,
    this.amount,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_id'] = this.menu.id;
    data['amount'] = this.amount;
    return data;
  }
}
