import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/auth_controller.dart';
import 'package:seemon/views/login/components/checkbox_license.dart';
import 'package:seemon/views/login/components/login_button.dart';
import 'package:seemon/views/login/components/phone_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController _controller = Get.put(AuthController());
    return WillPopScope(
      onWillPop: () => Get.delete<AuthController>(),
      child: Material(
        child: Navigator(
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (context2) => Builder(
              builder: (context) => CupertinoPageScaffold(
                child: GestureDetector(
                  onTap: () {
                    _controller.checkingPhoneAndUpdateUI();
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    color: const Color(0xfff6f1e8),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: IconButton(
                            iconSize: 28,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Get.delete<AuthController>().then((value) => Get.back());
                            },
                            icon: const Icon(
                              EvaIcons.close,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Column(
                            children: [
                              Container(padding: const EdgeInsets.only(top: kPaddingDefault)),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: kPaddingItems),
                                child: Text(
                                  "Chào Bạn!",
                                  style: kStyleLoginHeader,
                                ),
                              ),
                              Text(
                                "Đăng ký Thành Viên của Highlands Coffee để nhận\nnhiều ưu đãi hơn!",
                                style: kStyleLoginHeaderText,
                                textAlign: TextAlign.center,
                              ),
                              const phone_input(),
                              const checkbox_license(),
                              const Spacer(),
                              const login_button(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
