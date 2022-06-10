import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/payment/notloggedIn/components/login_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

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
              "Highlands Trả Trước",
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
                  "assets/images/payment_placeholder.png",
                  height: 200,
                  width: 250,
                ),
                Spacer(),
                Text("Thanh toán nhanh\nchóng và dễ dàng", style: kStyleHeader),
                Spacer(),
                Text(
                  "Dùng Highlands Trả Trước để có trải nghiệm thanh\ntoán không dùng tiền mặt thuận tiện nhất.",
                  style: kStyleDescription,
                  textAlign: TextAlign.center,
                ),
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
