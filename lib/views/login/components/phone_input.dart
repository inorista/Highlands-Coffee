import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/auth_controller.dart';

class phone_input extends GetWidget<AuthController> {
  const phone_input({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    TextEditingController phoneController = new TextEditingController();
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) {
        Color getBorderInputColor() {
          if (authController.statsInputBorder == "normal") {
            return kPhoneInputBorderNormal;
          } else if (authController.statsInputBorder == "incorrect") {
            return kPhoneInputBorderIncorrect;
          }
          return kPhoneInputBorderCorrect;
        }

        double getOpacity() {
          if (authController.statsInputBorder == "incorrect") {
            return 1;
          } else {
            return 0;
          }
        }

        return Padding(
          padding: EdgeInsets.only(top: kPaddingDefault * 4),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kPaddingDefault * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: getBorderInputColor(), width: 1.25),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/phone_icon.png",
                          height: 25,
                          width: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: kPaddingDefault),
                          child: Text("+84", style: kStyleLoginPrefixPhone),
                        ),
                        Expanded(
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            autofocus: true,
                            onTap: () => focusNode.requestFocus(),
                            focusNode: focusNode,
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            onChanged: (text) {
                              controller.updateTextLength(text);
                            },
                            style: kStyleInput,
                            maxLines: 1,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              isCollapsed: true,
                              border: InputBorder.none,
                              hintText: "Nhập số điện thoại",
                              hintStyle: kStyleInputHint,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: getOpacity(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: kPaddingSize),
                    child: Row(
                      children: [
                        Icon(
                          EvaIcons.alertCircleOutline,
                          color: Color(0xffFF2702),
                          size: 20,
                        ),
                        Text(
                          " Số điện thoại không hợp lệ",
                          style: kStyleErrorText,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
