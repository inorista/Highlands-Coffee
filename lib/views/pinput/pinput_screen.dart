import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pinput/pinput.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/auth_controller.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/injection.dart';
import 'package:seemon/views/dashboard/dashboard_screen.dart';
import 'package:seemon/views/home/home_screen.dart';
import 'package:seemon/views/login/components/checkbox_license.dart';
import 'package:seemon/views/login/components/login_button.dart';
import 'package:seemon/views/login/components/phone_input.dart';
import 'package:seemon/views/pinput/components/confirm_button.dart';

class PinputScreen extends StatelessWidget {
  const PinputScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController _controller = Get.put(AuthController());
    final pinputFocusNode = FocusNode();
    final pinController = TextEditingController();
    pinputFocusNode.requestFocus();
    return CupertinoPageScaffold(
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
                iconSize: 26,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  EvaIcons.arrowIosBack,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Container(padding: const EdgeInsets.only(top: kPaddingDefault)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPaddingDefault),
                    child: Text(
                      "Xác thực Số Điện Thoại",
                      style: kStyleLoginHeader,
                    ),
                  ),
                  Text(
                    "Nhập mã Mã Xác Thực được gửi tới",
                    style: kStyleLoginHeaderText,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPaddingDefault),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("+84 ", style: kStyleCofirmPhone),
                        ...List.generate(
                          _controller.currentPhone.length,
                          (index) {
                            if (index == 2 || index == 5) {
                              return Text("${_controller.currentPhone[index]} ", style: kStyleCofirmPhone);
                            }
                            return Text("${_controller.currentPhone[index]}", style: kStyleCofirmPhone);
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPaddingDefault * 2),
                    child: Pinput(
                      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                      controller: pinController,
                      closeKeyboardWhenCompleted: true,
                      focusNode: pinputFocusNode,
                      length: 6,
                      defaultPinTheme: PinTheme(
                        width: 45,
                        height: 45,
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: kPinNotFilled,
                              width: 0.75,
                            ),
                          ),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 45,
                        height: 45,
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: kPinFilled,
                              width: 0.75,
                            ),
                          ),
                        ),
                      ),
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) async {
                        await _controller.verifyCode(pin);
                        Future.delayed(
                          const Duration(seconds: 2),
                          () async {
                            Get.back();
                            Get.delete<AuthController>();
                            locator.get<HomeController>().auth?.currentUser?.reload();
                          },
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  const confirm_button(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
