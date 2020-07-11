import 'package:delesapp/data/models/order_detail_model.dart';

class Order {
  int id;
  String userId;
  String paymentTotal;
  String paymentToken;
  String note;
  String status;
  String createdAt;
  String updatedAt;
  List<OrderDetail> details;

  Order(
      {this.id,
      this.userId,
      this.paymentTotal,
      this.paymentToken,
      this.note,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.details});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    paymentTotal = json['payment_total'];
    paymentToken = json['payment_token'];
    note = json['note'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['details'] != null) {
      details = new List<OrderDetail>();
      json['details'].forEach((v) {
        details.add(new OrderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['payment_total'] = this.paymentTotal;
    data['payment_token'] = this.paymentToken;
    data['note'] = this.note;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
