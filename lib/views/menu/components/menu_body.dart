import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/models/category.dart';
import 'package:seemon/views/menu/components/tab_view.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class menu_body extends StatelessWidget {
  const menu_body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return FutureBuilder(
      future: _controller.futureAllProduct,
      builder: (context, AsyncSnapshot sn) {
        if (!sn.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return VerticalScrollableTabView(
          tabController: _controller.tabController,
          listItemData: _controller.allCategory,
          verticalScrollPosition: VerticalScrollPosition.begin,
          eachItemChild: (object, index) => TabView(crCategory: object),
          slivers: [
            Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: SliverAppBar(
                shadowColor: Colors.black45,
                elevation: 3,
                forceElevated: true,
                backgroundColor: Colors.white,
                pinned: true,
                toolbarHeight: 0,
                bottom: TabBar(
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
                  onTap: (index) {
                    VerticalScrollableTabBarStatus.setIndex(index);
                  },
                  tabs: _controller.allCategory
                      .map((crCategory) => Tab(text: crCategory.nameCategory.toTitleCase()))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
