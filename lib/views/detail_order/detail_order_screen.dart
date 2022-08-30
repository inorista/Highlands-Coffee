import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/injection.dart';
import 'package:seemon/models/order.dart';
import 'package:intl/intl.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({Key? key, this.order}) : super(key: key);
  final order;
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        titleTextStyle: kStyleTitleAppbar_Cart,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            EvaIcons.arrowIosBack,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
        child: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Column(
              children: [
                Text(this.order.branch, style: kStyleBranchName),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingListView),
                  child: Text(
                    "${DateFormat("dd, MMM, yyyy hh:mm").format(this.order.createdAt.toDate().toLocal())}",
                    style: kStyleDateOrderDetail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingDefault),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: this.order.cartItem.length,
                    itemBuilder: (context, index) {
                      final currentItem = this.order.cartItem[index].split(',');
                      return Padding(
                        padding: const EdgeInsets.only(top: kPaddingDefault),
                        child: Container(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${currentItem[2]}x",
                                    style: kStyleQuantityOrderItems,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${currentItem[0].toString().toTitleCase()}",
                                          style: kStyleProductName,
                                        ),
                                        Text(
                                          "Size ${currentItem[1]}",
                                          style: kStyleNote_CartItems,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${currencyFormatter.format(double.parse(currentItem[3]))}₫",
                                    style: kStyleTotalOrderItems,
                                  ),
                                ],
                              ),
                              Spacer(),
                              buildDivider(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: kPaddingSize),
                          child: Text(
                            "Tạm tính (${this.order.quantity} món)",
                            style: kStyleSubTotal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: kPaddingSize),
                          child: Text(
                            "${currencyFormatter.format(this.order.total).toString()}₫",
                            style: kStyleAllSubtotal,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tổng cộng",
                          style: kStyleTotal_OneCartItem,
                        ),
                        Text(
                          "${currencyFormatter.format(this.order.total).toString()}₫",
                          style: kStyleTotal_OneCartItem,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(height: 22),
                buildDivider(),
                Container(height: 22),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffb59664).withOpacity(0.8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          buildInfo("Mã đơn hàng", "${this.order.id_order}"),
                          Spacer(),
                          buildInfo(
                            "Tên",
                            "${locator<HomeController>().auth?.currentUser?.phoneNumber.toString().replaceAll("+84", "0")}",
                          ),
                          Spacer(),
                          buildInfo("Chi nhánh", "${this.order.branch}"),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfo(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 130,
          child: Text(
            "${title}",
            style: kStyleInfoOrderTitle,
            overflow: TextOverflow.visible,
          ),
        ),
        Flexible(
          child: Text(
            "${info}",
            style: kStyleInfoOrder,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Divider buildDivider() {
    return const Divider(
      thickness: 1.5,
      indent: 0,
      endIndent: 0,
      height: 1,
      color: Color(0xffeaeaea),
    );
  }
}
