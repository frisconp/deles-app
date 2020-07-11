class OrderDetail {
  int id;
  String orderId;
  String menuId;
  String amount;
  String createdAt;
  String updatedAt;

  OrderDetail(
      {this.id,
      this.orderId,
      this.menuId,
      this.amount,
      this.createdAt,
      this.updatedAt});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    menuId = json['menu_id'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['menu_id'] = this.menuId;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
