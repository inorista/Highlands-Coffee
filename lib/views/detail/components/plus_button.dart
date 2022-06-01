import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/controllers/detail_controllers.dart';

class plus_button extends GetWidget<DetailController> {
  const plus_button({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color isQuantityMinimum() {
      return kQuantityNotMinimum;
    }

    var kStyleButton = GoogleFonts.notoSans(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: isQuantityMinimum(),
    );

    return InkWell(
      onTap: () => controller.increaseQuantity(),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: isQuantityMinimum()),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Icon(
            EvaIcons.plus,
            size: 18,
            color: isQuantityMinimum(),
          ),
        ),
      ),
    );
  }
}
