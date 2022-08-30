import 'package:flutter/material.dart';
import 'package:seemon/constants/style_constants..dart';

class payment_appbar extends StatelessWidget with PreferredSizeWidget {
  const payment_appbar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Highlands Trả Trước",
        style: kStyleTitleAppbar_Order,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 60,
    );
  }
}
