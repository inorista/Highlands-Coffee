import 'package:flutter/material.dart';
import 'package:seemon/constants/style_constants..dart';

class order_appbar extends StatelessWidget with PreferredSizeWidget {
  const order_appbar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(65);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Đơn hàng",
        style: kStyleTitleAppbar_Order,
      ),
      backgroundColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.white,
      toolbarHeight: 60,
    );
  }
}
