import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/cart_controller.dart';

class order_button extends StatelessWidget {
  const order_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');

    return GetBuilder<CartController>(
        init: CartController(),
        builder: (_controller) {
          return GestureDetector(
            onTap: () async {
              /*_controller.postOrder();*/
              await CustomProgressDialog.future(
                context,
                blur: 5,
                future: Future.delayed(
                  Duration(milliseconds: 1500),
                  () {
                    _controller.postOrder();
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
            child: Padding(
              padding: EdgeInsets.all(kPaddingDefault),
              child: Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffB3282D),
                ),
                child: Center(
                  child: Text(
                    "Đặt ${_controller.totalQuantity} Món: ${currencyFormatter.format(_controller.totalOnBill).toString()}₫",
                    style: kAddButtonText,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
