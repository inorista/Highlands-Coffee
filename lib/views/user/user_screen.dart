import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/dashboard/dashboard_screen.dart';
import 'package:seemon/views/login/login_screen.dart';
import 'package:seemon/views/other/about_hc_screen.dart';
import 'package:seemon/views/other/about_screen.dart';
import 'package:seemon/views/other/confirm_dialog.dart';
import 'package:seemon/views/update/update_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        Color getColorBackground() {
          if (_controller.auth?.currentUser != null) {
            return Colors.white;
          }
          return Color(0xfffefbf1);
        }

        Column getColumnInfo() {
          if (_controller.auth?.currentUser != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc("${_controller.auth?.currentUser?.phoneNumber}")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final userName = snapshot.data?.data()?['hoten'];
                      if (userName == null || userName == "") {
                        return Text(
                          "Chào Bạn!",
                          style: kStyleWelcomeUser,
                        );
                      } else {
                        return Text(
                          "${userName}",
                          style: kStyleWelcomeUser,
                        );
                      }
                    }
                    return CupertinoActivityIndicator();
                  },
                ),
                Container(height: 10),
                GestureDetector(
                  onTap: () => Get.to(
                    () => UpdateScreen(),
                    transition: Transition.rightToLeft,
                  ),
                  child: Text(
                    "Cập nhật thông tin",
                    style: kStyleUpdateProfile,
                  ),
                ),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Đăng Ký / Đăng Nhập",
                style: kStyleLoginUser,
              ),
              Container(height: 10),
              Text(
                "Đăng ký tài khoản và nhận ngay quà tặng hấp dẫn",
                style: kStylePromoUser,
              ),
            ],
          );
        }

        Padding getLogOutButton() {
          if (_controller.auth?.currentUser != null) {
            return Padding(
              padding: const EdgeInsets.all(kPaddingDefault),
              child: GestureDetector(
                onTap: () async {
                  await showDialog(context: context, builder: (BuildContext context) => ConfirmLogoutDialog());
                },
                child: Row(
                  children: <Widget>[
                    const Icon(
                      EvaIcons.logOut,
                      size: 20,
                      color: Color(0xff333333),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPaddingItems),
                      child: Text(
                        "Đăng xuất",
                        style: kStyleBranch,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Padding(padding: EdgeInsets.zero);
        }

        return Scaffold(
          backgroundColor: Color(0xffd7d7d7),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -360,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingDefault * 1.5),
                      height: 520,
                      width: MediaQuery.of(context).size.width,
                      color: getColorBackground(),
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/profile_icon.png",
                                height: 70,
                                width: 70,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kPaddingDefault * 2,
                                  ),
                                  child: getColumnInfo(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        addAutomaticKeepAlives: true,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: kPaddingItems),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: kPaddingDefault * 1.5,
                                horizontal: kPaddingDefault,
                              ),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildTitle(
                                    "assets/images/hc_info.png",
                                    "Thông tin chung",
                                  ),
                                  Container(height: 18),
                                  buildFeature(
                                    "Về Highlands Coffee",
                                    () => Get.to(
                                      () => AboutScreen(),
                                      transition: Transition.rightToLeft,
                                    ),
                                    EvaIcons.arrowIosForward,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: kPaddingItems),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: kPaddingDefault * 1.5,
                                horizontal: kPaddingDefault,
                              ),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildTitle(
                                    "assets/images/hc_etc.png",
                                    "Khác",
                                  ),
                                  Container(height: 18),
                                  buildFeature(
                                    "Về ứng dụng",
                                    () => Get.to(() => AboutSoftwareScreen(), transition: Transition.rightToLeft),
                                    EvaIcons.arrowIosForward,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          getLogOutButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row buildTitle(String url, String title) {
    return Row(
      children: [
        Image.asset(
          "${url}",
          height: 20,
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingItems),
          child: Text(
            "${title}",
            style: kStyleTitleUser,
          ),
        ),
      ],
    );
  }

  GestureDetector buildFeature(String title, VoidCallback press, IconData icon) {
    return GestureDetector(
      onTap: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${title}",
            style: kStylePartUser,
          ),
          Icon(
            icon,
            size: 20,
            color: Color(0xff666666),
          )
        ],
      ),
    );
  }
}
