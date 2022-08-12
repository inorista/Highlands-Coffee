import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';

class menu_appbar extends StatefulWidget with PreferredSizeWidget {
  const menu_appbar({
    Key? key,
  }) : super(key: key);

  @override
  State<menu_appbar> createState() => _menu_appbarState();

  @override
  Size get preferredSize => Size.fromHeight(65);
}

class _menu_appbarState extends State<menu_appbar> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return AppBar(
      leadingWidth: MediaQuery.of(context).size.width,
      elevation: 0,
      backgroundColor: Color(0xffa43533),
      leading: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Image.asset(
                "assets/images/location.png",
                height: 25,
                width: 25,
              ),
            ),
            GestureDetector(
              onTap: () => _controller.showChangeMethodBottomSheet(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Nhận món tại", style: kStyleTakeLocation),
                  Spacer(flex: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lê Văn Sỹ", style: kStyleLocation),
                      Icon(EvaIcons.arrowDown, color: Colors.white, size: 14),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
      /*bottom: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Color(0xffa43533)),
              ),
              labelColor: Color(0xffa43533),
              labelStyle: kStyleTabbarSelected,
              unselectedLabelStyle: kStyleTabbarUnSelected,
              unselectedLabelColor: Color(0xff221f20),
              controller: _controller.tabController,
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(horizontal: kPaddingSize),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              tabs: _controller.allCategory
                  .map((crCategory) => Tab(text: crCategory.nameCategory.toTitleCase()))
                  .toList()),
        ),
      ),*/
    );
  }
}
