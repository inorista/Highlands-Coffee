import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/auth_controller.dart';
import 'package:seemon/views/pinput/pinput_screen.dart';

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
          if (authController.isAcceptLicense == false || authController.textLength < 9) {
            return kIsNotAcceptedLicenseSplash;
          }
          return kIsAcceptedLicenseSplash;
        }

        Color getLoginButtonColor() {
          if (authController.isAcceptLicense == false || authController.textLength < 9) {
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
              onPressed: () async {
                if (authController.isAcceptLicense == true) {
                  if (authController.checkingAuthPhone() == true) {
                    authController.signingwithPhoneNumber();
                    Future.delayed(Duration(seconds: 2));
                    Navigator.of(context).push(
                      /*MaterialWithModals*/ PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (context, animation, anotherAnimation) => PinputScreen(),
                        transitionsBuilder: (context, animation, anotherAnimation, child) {
                          var begin = Offset(1, 0);
                          var end = Offset.zero;
                          var tween = Tween(begin: begin, end: end);
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return null;
                }
              },
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
