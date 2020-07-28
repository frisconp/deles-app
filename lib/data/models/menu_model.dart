import 'package:delesapp/data/models/user_model.dart';

class Menu {
  int id;
  String name;
  String photo;
  String price;
  String stockAmount;
  String userId;
  String menuCategoryId;
  String createdAt;
  String updatedAt;
  User user;

  Menu({
    this.id,
    this.name,
    this.photo,
    this.price,
    this.stockAmount,
    this.userId,
    this.menuCategoryId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = json['price'];
    stockAmount = json['stock_amount'];
    userId = json['user_id'];
    menuCategoryId = json['menu_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['stock_amount'] = this.stockAmount;
    data['user_id'] = this.userId;
    data['menu_category_id'] = this.menuCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
