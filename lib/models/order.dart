import 'package:cloud_firestore/cloud_firestore.dart';

class order {
  Timestamp? createdAt;
  int? total;
  String? id_order;
  int? quantity;
  List<String>? cartItem;
  String? status;
  String? branch;

  order({this.createdAt, this.total, this.id_order, this.quantity, this.cartItem, this.status, this.branch});

  order.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    total = json['total'];
    id_order = json['id_order'];
    quantity = json['quantity'];
    cartItem = json['cartItem'].cast<String>();
    status = json['status'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['total'] = this.total;
    data['id_order'] = this.id_order;
    data['quantity'] = this.quantity;
    data['cartItem'] = this.cartItem;
    data['status'] = this.status;
    data['branch'] = this.branch;
    return data;
  }
}
