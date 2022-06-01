import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/detail_controllers.dart';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class add_button extends StatelessWidget {
  const add_button({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Fade Trasition

    final currencyFormatter = NumberFormat('###,000', 'ID');
    DetailController controller = Get.put(DetailController());
    final total = controller.total.obs;

    return Obx(
      () => Padding(
        padding: EdgeInsets.all(kPaddingDefault),
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffB3282D),
          ),
          child: Center(
            child: FadeTransition(
              opacity: controller.animation,
              child: Text(
                "Thêm vào giỏ : ${currencyFormatter.format(controller.total.value).toString()}₫",
                style: kAddButtonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
