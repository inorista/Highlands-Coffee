// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:seemon/models/product.dart';

class CartItem {
  final product item;
  final int quantity;
  final num total;
  final String size;
  CartItem({
    required this.item,
    required this.quantity,
    required this.size,
    required this.total,
  });

  CartItem copyWith({
    product? item,
    int? quantity,
    String? size,
    num? total,
  }) {
    return CartItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'item': item.toMap(),
      'quantity': quantity,
      'size': size,
      'total': total,
    };
  }
}
