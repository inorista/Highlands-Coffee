import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';

class AboutSoftwareScreen extends StatelessWidget {
  const AboutSoftwareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 4),
              Flexible(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/hc_logo.png",
                        height: 90,
                      ),
                      Spacer(flex: 2),
                      Text(
                        "Phiên Bản Ứng Dụng v0.2 Clone",
                        style: kStyleVersion,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault * 2.5),
                        child: Text(
                          "Được cấp phép bởi:\nCông ty Cổ Phần Dịch Vụ Cà Phê Cao Nguyên 127 Nguyễn Cơ Thạch, Phường An Lợi Đông, Quận 2, Hồ Chí Minh",
                          textAlign: TextAlign.center,
                          style: kStyleVersionText,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 2),
              Image.asset(
                "assets/images/verified.png",
                height: 60,
              ),
              Spacer(),
            ],
          ),
          Positioned(
            top: 30,
            left: 12,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                EvaIcons.arrowIosBack,
                size: 30,
                color: Color(0xff666666),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
