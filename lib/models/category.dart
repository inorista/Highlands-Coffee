import 'package:flutter/material.dart';
import 'package:seemon/models/product.dart';

class category {
  final String nameCategory;
  final List<product> categoryProduct;
  category({
    required this.nameCategory,
    required this.categoryProduct,
  });
}
