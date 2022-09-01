import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';

class ConfirmLogoutDialog extends StatelessWidget {
  const ConfirmLogoutDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(vertical: kPaddingDefault - 2),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bạn ơi có quên gì không?",
            style: kStyleDialog,
          ),
        ],
      ),
      content: Text(
        "Không còn gì nữa thì chúc một ngày tốt lành nha!",
        style: kStyleContentDialog,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: kPaddingDefault - 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FlatButton(
                  height: 42,
                  onPressed: () async {
                    await CustomProgressDialog.future(
                      context,
                      blur: 5,
                      future: Future.delayed(
                        Duration(milliseconds: 500),
                        () async {
                          await _controller.logOut();
                        },
                      ),
                      loadingWidget: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xffa43533), width: 1, style: BorderStyle.solid),
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.grey.withOpacity(0.5),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Phải đi thôi",
                      style: kStyleSelectedGender,
                    ),
                  ),
                ),
              ),
              Container(width: 18),
              Expanded(
                child: FlatButton(
                  height: 42,
                  padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                  onPressed: () {
                    Get.back();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xffa43533), width: 1, style: BorderStyle.solid),
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Color(0xffd7423f),
                  color: Color(0xffa43533),
                  child: Center(
                    child: Text(
                      "À khoan!",
                      style: kStyleCancel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
