import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/update_controller.dart';

class gender_widget extends StatelessWidget {
  final gender;
  final index;
  const gender_widget({
    required this.gender,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
      init: UpdateController(),
      builder: (_controller) {
        Color getBorderColor() {
          if (this.index == _controller.currentIndex) {
            return Color(0xffa43533);
          }
          return Color(0xff666666);
        }

        TextStyle getGenderStyle() {
          if (this.index == _controller.currentIndex) {
            return kStyleSelectedGender;
          }
          return kStyleUnSelectedGender;
        }

        return FlatButton(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
          onPressed: () {
            _controller.changeGender(index);
            _controller.setOnSaveButton(index.toString());
            Get.back();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: getBorderColor(), width: 1, style: BorderStyle.solid),
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.grey.withOpacity(0.5),
          color: Colors.white,
          child: Center(
            child: Text(
              "${gender}",
              style: getGenderStyle(),
            ),
          ),
        );
      },
    );
  }
}
