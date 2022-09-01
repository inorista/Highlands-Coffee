import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/cart_controller.dart';
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
    CartController _cart = Get.put(CartController());
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 400,
      elevation: 0,
      backgroundColor: Color(0xffa43533),
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Image.asset(
              "assets/images/location.png",
              height: 25,
              width: 25,
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => _controller.showChangeMethodBottomSheet(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Text("Nhận món tại", style: kStyleTakeLocation),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${_controller.currentBranch?.branchName}",
                          style: kStyleLocation,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(EvaIcons.arrowDown, color: Colors.white, size: 14),
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          )
        ],
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
