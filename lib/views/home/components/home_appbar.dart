import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/models/branch.dart';
import 'package:seemon/models/promo.dart';
import 'package:unicons/unicons.dart';

class home_appbar extends StatelessWidget with PreferredSizeWidget {
  const home_appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());

    return AppBar(
      leadingWidth: 0,
      centerTitle: false,
      title: Text(
        "Cùng đón một ngày thú vị nhé!",
        style: kStyleTitleAppbar,
      ),
      backgroundColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.3),
      toolbarHeight: 40,
      actions: [
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: const Icon(
            UniconsLine.qrcode_scan,
            color: kColorCommon,
            size: 18,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
