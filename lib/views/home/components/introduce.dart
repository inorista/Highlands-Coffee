import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:get/get.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/models/user.dart';

class introduce extends StatelessWidget {
  const introduce({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        if (_controller.auth?.currentUser != null) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 230,
                child: Image.asset(
                  "assets/images/background_pattern.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc("${_controller.auth?.currentUser?.phoneNumber}")
                    .snapshots(),
                builder: (context, snapshot) {
                  var userName = snapshot.data?.data()?['hoten'];
                  if (userName == null || userName == "") {
                    userName = "Chào Bạn!";
                  }
                  var currentPoint = snapshot.data?.data()?['point'];
                  String getPointImageAsset() {
                    if (currentPoint >= 100) {
                      return "assets/images/golden.jpg";
                    }
                    return "assets/images/silver.jpg";
                  }

                  String getPointImageFilterAsset() {
                    if (currentPoint >= 100) {
                      return "assets/images/golden_filter.png";
                    }
                    return "assets/images/silver_filter.png";
                  }

                  String getCurrentLevel() {
                    if (currentPoint >= 100) {
                      return "Phin Vàng";
                    }
                    return "Phin Bạc";
                  }

                  if (!snapshot.hasData) {
                    return CupertinoActivityIndicator();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(kPaddingDefault),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(getPointImageAsset()),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(kPaddingDefault * 1.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Color(0xffababab),
                                          width: 3,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/user_introduce.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${userName}",
                                            style: kStyleWelcome,
                                          ),
                                          Text(
                                            getCurrentLevel(),
                                            style: kStyleLevel,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/HC_point.png",
                                      height: 25,
                                      width: 25,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: kPaddingItems),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("${currentPoint.toStringAsFixed(1)}", style: kFirstLetterPoint),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text("Nhận món quà tiếp theo", style: kStyleLevel),
                                Spacer(),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Opacity(
                              opacity: 1,
                              child: Image.asset(
                                getPointImageFilterAsset(),
                                height: 120,
                                width: 160,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
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
                              height: 35,
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
                          onPressed: () {},
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
      },
    );
  }
}
