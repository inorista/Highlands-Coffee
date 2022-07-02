import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/auth_controller.dart';

class checkbox_license extends StatelessWidget {
  const checkbox_license({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) {
        Color getColorCheckbox() {
          if (authController.isAcceptLicense) {
            return kCheckedBox;
          }
          return kUnCheckBox;
        }

        Color getColorBorderCheckbox() {
          if (authController.isAcceptLicense) {
            return kCheckedBoxBorder;
          }
          return kUnCheckBoxBorder;
        }

        Color getColorCheckMark() {
          if (authController.isAcceptLicense) {
            return Colors.white;
          }
          return Colors.transparent;
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: kPaddingDefault),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  authController.checkingPhoneAndUpdateUI();
                  authController.onClickAcceptLicense();
                },
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    border: Border.all(color: getColorBorderCheckbox(), width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                    color: getColorCheckbox(),
                  ),
                  child: Center(
                    child: Icon(
                      EvaIcons.checkmark,
                      size: 14,
                      color: getColorCheckMark(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: kPaddingItems),
                child: Text(
                  "Đồng ý với ",
                  style: kStyleLicense_1,
                ),
              ),
              Text(
                "Điều khoản & Điều kiện",
                style: kStyleLicense_2,
              ),
            ],
          ),
        );
      },
    );
  }
}
