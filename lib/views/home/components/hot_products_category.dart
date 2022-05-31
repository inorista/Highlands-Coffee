import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';

class hot_products extends StatelessWidget {
  const hot_products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPaddingDefault),
      child: Text("Sản Phẩm Nổi Bật", style: kStyleCategory),
    );
  }
}
