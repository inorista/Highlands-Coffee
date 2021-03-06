import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:get/get.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/models/thucuong.dart';

class introduce extends StatelessWidget {
  const introduce({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<thucuong> listAdd = [banh_phomai_chanhday, banh_socola_highlands];
    HomeController _controller = Get.put(HomeController());
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 230,
          child: Image.asset("assets/images/background_pattern.png", fit: BoxFit.fitWidth),
        ),
        Padding(
          padding: const EdgeInsets.all(kPaddingDefault),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xffB3282D),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kPaddingDefault),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chào Bạn!",
                        style: kStyleWelcome,
                      ),
                      Text(
                        "Tham gia chương trình thành viên\ncủa Highlands Coffee ngay để tích\nđiểm và nhận quà hấp dẫn",
                        style: kStyleIntroduce,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          _controller.showLoginPage(context);
                        },
                        child: Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Đăng ký / Đăng nhập",
                              style: kStyleLoginButtonText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: -60,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      "assets/images/stack_pattern.png",
                      height: 150,
                      width: 250,
                    ),
                  ),
                ),
                Positioned(
                  top: kPaddingDefault,
                  right: kPaddingDefault,
                  child: SizedBox(
                    height: 14,
                    width: 14,
                    child: ElevatedButton(
                      onPressed: () {
                        for (int i = 0; i < listAdd.length; i++) {
                          _controller.add(listAdd[i]);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                        primary: Colors.black38, // <-- Button color
                        onPrimary: Colors.black54, // <-- Splash color
                      ),
                      child: const Icon(EvaIcons.arrowIosForward, size: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
