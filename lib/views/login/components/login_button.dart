import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/auth_controller.dart';

class login_button extends StatefulWidget {
  const login_button({
    Key? key,
  }) : super(key: key);

  @override
  State<login_button> createState() => _login_buttonState();
}

class _login_buttonState extends State<login_button> {
  double _opacity = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      setState(() {
        _opacity = 0.5;
      });
    }

    void onCancel() {
      setState(() {
        _opacity = 1;
      });
    }

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) {
        Color getLoginButtonSplashColor() {
          if (authController.isAcceptLicense == false) {
            return kIsNotAcceptedLicenseSplash;
          }
          return kIsAcceptedLicenseSplash;
        }

        Color getLoginButtonColor() {
          if (authController.isAcceptLicense == false) {
            return kIsNotAcceptedLicense;
          }
          return kIsAcceptedLicense;
        }

        return Padding(
          padding: EdgeInsets.symmetric(vertical: kPaddingDefault * 2, horizontal: kPaddingDefault),
          child: GestureDetector(
            onTapCancel: () => onCancel(),
            onTapDown: (_) => onPressed(),
            onTapUp: (_) => onCancel(),
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              highlightColor: getLoginButtonSplashColor(),
              splashColor: getLoginButtonSplashColor(),
              onPressed: () {},
              minWidth: MediaQuery.of(context).size.width,
              color: getLoginButtonColor(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: AnimatedOpacity(
                  opacity: _opacity,
                  curve: Curves.bounceIn,
                  duration: Duration(milliseconds: 200),
                  child: Text(
                    "Tiếp Tục",
                    style: kStyleLoginButtonText_reverse,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
