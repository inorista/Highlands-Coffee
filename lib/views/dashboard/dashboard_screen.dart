import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/home/home_screen.dart';
import 'package:seemon/views/home/components/home_appbar.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:seemon/views/menu/menu_screen.dart';
import 'package:seemon/views/order/order_screen.dart';
import 'package:seemon/views/payment/payment_screen.dart';
import 'package:seemon/views/user/user_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeScreen(),
              OrderScreen(),
              MenuScreen(),
              PaymentScreen(),
              UserScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 2))],
            ),
            child: BottomNavigationBar(
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xffB3282C),
              unselectedItemColor: Color(0xff685A53),
              iconSize: 22,
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
                    child: Icon(Iconsax.receipt),
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
                    child: Icon(Iconsax.wallet_3),
                  ),
                  label: "Trả trước",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Icon(Iconsax.user),
                  ),
                  label: "Tài Khoản",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
