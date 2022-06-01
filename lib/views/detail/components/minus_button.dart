import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/controllers/detail_controllers.dart';

class minus_button extends GetWidget<DetailController> {
  const minus_button({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color isQuantityMinimum() {
      if (controller.quantity == 1) {
        return kQuantityMinimum;
      }
      return kQuantityNotMinimum;
    }

    return InkWell(
      onTap: () => controller.decreaseQuantity(),
      child: Obx(
        () => Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: isQuantityMinimum()),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              EvaIcons.minus,
              size: 18,
              color: isQuantityMinimum(),
            ),
          ),
        ),
      ),
    );
  }
}
