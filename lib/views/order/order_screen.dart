import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/order/notloggenIn/components/login_button.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Đơn hàng",
              style: kStyleTitleAppbar_Order,
            ),
            backgroundColor: Colors.white,
            elevation: 2,
            toolbarHeight: 60,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 4),
                Image.asset(
                  "assets/images/order_placeholder.png",
                  height: 200,
                  width: 200,
                ),
                Spacer(),
                Text("Đơn Hàng &\n Hoạt Động", style: kStyleHeader),
                Spacer(),
                Text("Theo dõi đơn hàng và lịch sử drip của bạn", style: kStyleDescription),
                Spacer(flex: 4),
                login_button(),
              ],
            ),
          ),
        );
      },
    );
  }
}
