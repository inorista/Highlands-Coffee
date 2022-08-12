import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/order/components/history_screen.dart';
import 'package:seemon/views/order/components/login_button.dart';
import 'package:seemon/views/order/components/order_appbar.dart';
import 'package:seemon/views/order/components/processing_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        Widget getBody() {
          if (_controller.auth!.currentUser != null) {
            return DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: const BoxConstraints.expand(height: 50),
                    child: Theme(
                      data: ThemeData().copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: TabBar(
                        indicatorColor: kIndicatorTabbar,
                        labelColor: kIndicatorTabbar,
                        unselectedLabelColor: kUnselectedTabbar,
                        labelStyle: kStyleTabbars,
                        unselectedLabelStyle: kStyleUnselectedTabbars,
                        tabs: const [
                          Tab(text: "Đang diễn ra"),
                          Tab(text: "Lịch sử"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      ProcessingScreen(),
                      HistoryScreen(),
                    ]),
                  )
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                Image.asset(
                  "assets/images/order_placeholder.png",
                  height: 200,
                  width: 200,
                ),
                const Spacer(),
                Text("Đơn Hàng &\n Hoạt Động", style: kStyleHeader),
                const Spacer(),
                Text("Theo dõi đơn hàng và lịch sử drip của bạn", style: kStyleDescription),
                const Spacer(flex: 4),
                const login_button(),
              ],
            ),
          );
        }

        return Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: const order_appbar(),
          body: getBody(),
        );
      },
    );
  }
}
