import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/models/thucuong.dart';

class menu_item extends StatelessWidget {
  const menu_item({
    Key? key,
    required this.crProduct,
  }) : super(key: key);

  final thucuong crProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(-0.1, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 200,
              color: Color(0xfff7f1e8),
              child: Center(
                child: Image.network(
                  crProduct.anhThucuong,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            crProduct.tenThucuong,
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
