import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/home/components/body.dart';
import 'package:seemon/views/home/components/appbar.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:seemon/views/menu/menu_screen.dart';
import 'package:seemon/views/order/order_screen.dart';
import 'package:seemon/views/payment/payment_screen.dart';
import 'package:seemon/views/user/user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: home_appbar(),
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeBody(),
              OrderScreen(),
              MenuScreen(),
              PaymentScreen(),
              UserScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xffB3282C),
            unselectedItemColor: Color(0xff685A53),
            iconSize: 20,
            showUnselectedLabels: true,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(Linecons.cup),
                ),
                label: "Trang Chủ",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(Linecons.doc),
                ),
                label: "Đơn hàng",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(LineariconsFree.coffee_cup),
                ),
                label: "Đặt Hàng",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(Linecons.wallet),
                ),
                label: "Trả trước",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(LineariconsFree.users),
                ),
                label: "Tài Khoản",
              ),
            ],
          ),
        );
      },
    );
  }
}
