import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/injection.dart';
import 'package:seemon/views/payment/components/header_shape.dart';
import 'package:seemon/views/payment/components/login_button.dart';
import 'package:seemon/views/payment/components/payment_appbar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (locator.get<HomeController>().auth?.currentUser != null) {
          return Scaffold(
            backgroundColor: Color(0xfff6f6f6),
            extendBodyBehindAppBar: false,
            resizeToAvoidBottomInset: false,
            appBar: payment_appbar(),
            body: Material(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipPath(
                            clipper: HeaderShape(),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: double.infinity,
                              color: Color(0xfffefefe),
                              child: Image.asset(
                                "assets/images/slanted-gradient2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Column(
                              children: [
                                Text("SỐ DƯ", style: kStyleTextBalance),
                                Container(height: 8),
                                Text("0", style: kStyleBalance),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: MediaQuery.of(context).size.width * 0.147,
                            child: Image.asset(
                              "assets/images/payment_more.png",
                              height: MediaQuery.of(context).size.height * 0.11,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                        child: Text(
                          "Khám phá trải nghiệm thanh toán",
                          style: kStyleTryPayment,
                        ),
                      ),
                      Container(height: 12),
                      buildFeature(
                        "assets/images/payfirst_icon.png",
                        "Trả trước dễ dàng",
                        "Hỗ trợ việc trả trước vào tài khoản của bạn tại cửa hàng hoặc trực tuyến bằng nhiều loại thẻ.",
                      ),
                      buildFeature(
                        "assets/images/payez_icon.png",
                        "Thanh toán đơn giản",
                        "Hoàn tất thanh toán các đơn đặt hàng trực tuyên của bạn chỉ trong một bước",
                      ),
                      buildFeature(
                        "assets/images/protect_icon.png",
                        "Độ bảo mật cao",
                        "Bạn có thể yên tâm trải nghiệm vì độ bảo mật được đảm bảo ở mức cao nhất.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: payment_appbar(),
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

  Container buildFeature(String urlImage, String title, String text) {
    return Container(
      height: 90,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault + 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "${urlImage}",
                  height: 30,
                  width: 30,
                ),
                Container(width: 20),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${title}",
                        style: kStyleFeatureTitle,
                      ),
                      Container(height: 10),
                      Text(
                        "${text}",
                        style: kStyleFeatureInfo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          buildDivider(),
        ],
      ),
    );
  }

  Divider buildDivider() {
    return const Divider(
      thickness: 1.5,
      indent: 0,
      endIndent: 0,
      height: 1,
      color: Color(0xffe5e5e5),
    );
  }
}
