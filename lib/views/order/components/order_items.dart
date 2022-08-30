import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:intl/intl.dart';
import 'package:seemon/views/detail_order/detail_order_screen.dart';

class order_items extends StatelessWidget {
  const order_items({
    Key? key,
    required this.order,
  }) : super(key: key);
  final order;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');
    return GestureDetector(
      onTap: () => Get.to(
        transition: Transition.rightToLeft,
        () => DetailOrderScreen(
          order: this.order,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingDefault / 1.5),
        child: Container(
          padding: const EdgeInsets.all(kPaddingItems),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kCommonCartColor,
                    ),
                    child: const Center(
                      child: Icon(
                        EvaIcons.checkmark,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kPaddingSize),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${this.order.status}", style: kStyleSize_OneCartItem),
                        Text(" · ", style: kStyleDot),
                        Text(
                          "${DateFormat("dd, MMM").format(this.order.createdAt.toDate().toLocal())}",
                          style: kStyleDateAndTotal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text("${this.order.branch}", style: kStyleBranch),
              Spacer(),
              Row(
                children: [
                  Text("${currencyFormatter.format(this.order.total)}₫ (Đến lấy)", style: kStyleDateAndTotal),
                  Text(" · ", style: kStyleDot),
                  Text("${this.order.quantity} Món", style: kStyleDateAndTotal),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
