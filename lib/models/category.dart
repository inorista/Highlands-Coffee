import 'package:flutter/material.dart';
import 'package:seemon/models/thucuong.dart';

class category {
  final String nameCategory;
  final List<thucuong> categoryProduct;
  category({
    required this.nameCategory,
    required this.categoryProduct,
  });
}
