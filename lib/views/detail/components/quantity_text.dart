import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/detail_controllers.dart';

class quantity_text extends StatelessWidget {
  const quantity_text({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.put(DetailController());
    final quantity = controller.quantity.obs;
    return Obx(
      () => Text(
        quantity.toString(),
        style: kStyleQuantity,
      ),
    );
  }
}
