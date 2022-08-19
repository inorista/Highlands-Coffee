import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/cart_controller.dart';
import 'package:seemon/controllers/detail_controllers.dart';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:seemon/models/product.dart';

class add_button extends StatelessWidget {
  final product item;
  const add_button({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Fade Trasition

    final currencyFormatter = NumberFormat('###,000', 'ID');
    DetailController _controller = Get.put(DetailController());
    CartController _cart = Get.put(CartController());
    final total = _controller.total.obs;

    return Obx(
      () => GestureDetector(
        onTap: () {
          _cart.addToCart(
            this.item,
            _controller.quantity.toInt(),
            this.item.listSize[_controller.selectedSize],
            _controller.total.value,
          );
          Get.back();
        },
        child: Padding(
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
                opacity: _controller.animation,
                child: Text(
                  "Thêm vào giỏ : ${currencyFormatter.format(_controller.total.value).toString()}₫",
                  style: kAddButtonText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
