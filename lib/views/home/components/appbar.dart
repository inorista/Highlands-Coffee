import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:seemon/constants/style_constants..dart';

class home_appbar extends StatelessWidget with PreferredSizeWidget {
  const home_appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      centerTitle: false,
      title: Text(
        "Cùng đón một ngày thú vị nhé!",
        style: kStyleTitleAppbar,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 40,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Ionicons.qr_code_outline,
            color: Colors.black,
            size: 16,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
