import 'package:flutter/material.dart';
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
        return Padding(
          padding: EdgeInsets.all(kPaddingDefault * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: kPaddingItems),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffFF0000), width: 1.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Container(
                      child: Flexible(
                        child: TextField(
                          autofocus: true,
                          onTap: () => focusNode.requestFocus(),
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          onChanged: (text) {
                            controller.updateTextLength(text.length);
                          },
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Color(0xff3e4680),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Email...",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xff8c8c8c),
                            ),
                          ),
                        ),
                      ),
                    ),
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
