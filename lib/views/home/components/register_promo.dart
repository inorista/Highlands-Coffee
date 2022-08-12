import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/models/promo.dart';

class register_promo extends StatelessWidget {
  const register_promo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        if (_controller.auth?.currentUser != null) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(kPaddingDefault),
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xffFEFCEF),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 76,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xffc4c4c4), width: 3),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/member_logged.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: kPaddingDefault),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              "HOÀN THÀNH THÔNG TIN TÀI KHOẢN",
                              style: kStyleRegisterText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: kPaddingDefault),
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final listPromo = [combo_thang_6, tranh_thu_upsize];
                                    for (int i = 0; i < listPromo.length; i++) {
                                      _controller.addPromo(listPromo[i]);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    elevation: 0,
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.zero,
                                    primary: Color(0xffbfbcb5), // <-- Button color
                                    onPrimary: Color(0xff7c786f), // <-- Splash color
                                  ),
                                  child: Icon(
                                    EvaIcons.arrowIosForward,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Flexible(
                          child: Text(
                            "Nhận ưu đãi 10.000 đồng khi cập nhật thông tin tài khoản",
                            style: kStylePromoText,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Spacer(flex: 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(kPaddingDefault),
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xffFEFCEF),
          ),
          child: Row(
            children: [
              Container(
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Color(0xffc4c4c4), width: 3),
                ),
                child: Center(
                  child: Image.asset("assets/images/member_card.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: kPaddingDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "ĐĂNG KÝ TÀI KHOẢN MỚI",
                          style: kStyleRegisterText,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: kPaddingDefault),
                          child: SizedBox(
                            height: 16,
                            width: 16,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: CircleBorder(),
                                padding: EdgeInsets.zero,
                                primary: Color(0xffbfbcb5), // <-- Button color
                                onPrimary: Color(0xff7c786f), // <-- Splash color
                              ),
                              child: Icon(EvaIcons.arrowIosForward, size: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 3),
                    Text("TẶNG MÃ GIẢM GIÁ 50% CHÀO\nBẠN MỚI", style: kStylePromoText),
                    Spacer(flex: 4),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
