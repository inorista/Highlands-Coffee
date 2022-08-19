import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/cart_controller.dart';
import 'package:intl/intl.dart';
import 'package:seemon/views/cart/components/order_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (_controller) {
        final currencyFormatter = NumberFormat('###,000', 'ID');
        return Scaffold(
          backgroundColor: Color(0xffe5e5e5),
          appBar: AppBar(
            toolbarHeight: 50,
            titleTextStyle: kStyleTitleAppbar_Cart,
            backgroundColor: Colors.white,
            title: Text("Thanh toán"),
            centerTitle: true,
            elevation: 10,
            shadowColor: Colors.black26,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _controller.cleanCart();
                      Get.back();
                    },
                    child: Text(
                      "Xóa tất cả",
                      style: kStyleActionText,
                    ),
                  ),
                ),
              ),
            ],
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                EvaIcons.arrowIosBack,
                size: 25,
                color: Color(0xff666666),
              ),
            ),
          ),
          body: Stack(
            children: [
              ListView(
                addAutomaticKeepAlives: true,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: kPaddingItems),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(kPaddingDefault),
                            width: double.infinity,
                            child: Text(
                              "Đến lấy",
                              style: kOrderMethodCart,
                            ),
                          ),
                          buildDivider(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/location_icon.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Lê Văn Sỹ", style: kStyleTitleLocation),
                                      Flexible(
                                        child: Text(
                                          "188",
                                          style: kLocationCart,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildDivider(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/user_icon.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chưa có Tên liên hệ", style: kStyleTitleLocation),
                                      Flexible(
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                              _controller.auth!.phoneNumber!.length,
                                              (index) {
                                                if (index == 2 || index == 5 || index == 8) {
                                                  return Text(
                                                    "${_controller.auth?.phoneNumber![index].toString()} ",
                                                    style: kInfomationCart,
                                                  );
                                                }
                                                return Text(
                                                  "${_controller.auth!.phoneNumber![index].toString()}",
                                                  style: kInfomationCart,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildDivider(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/time_icon.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                  child: Text("Thời gian lấy hàng", style: kInfomationCart),
                                ),
                                Spacer(),
                                Text(
                                  "Trong vòng 15 phút",
                                  style: kStyleTitleLocation,
                                ),
                              ],
                            ),
                          ),
                          buildDivider(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/note_icon.png",
                                  height: 20,
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                                  child: Text("Thời gian lấy hàng", style: kInfomationCart),
                                ),
                                Spacer(),
                                Text(
                                  "Trong vòng 15 phút",
                                  style: kInfomationCart,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPaddingDefault / 2),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingItems),
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Món", style: kListCart),
                                GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: kPaddingItems),
                                        child: Text("Thêm", style: kStyleAddMoreCart),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1,
                                            color: kCommonCartColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: const Icon(
                                            EvaIcons.plus,
                                            size: 18,
                                            color: kCommonCartColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildDivider(),
                          ListView.builder(
                            shrinkWrap: true, // new line
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _controller.cartItem.length,
                            itemBuilder: (context, index) => Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: kPaddingItems),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 80,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: _controller.cartItem[index].item.anhThucuong,
                                                  height: 50,
                                                  width: 50,
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 18,
                                                    width: 18,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: kCommonBackgroundCart,
                                                      border: Border.all(
                                                        width: 1,
                                                        color: kCommonCartColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        _controller.cartItem[index].quantity.toString(),
                                                        style: kStyleQuantityBox,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: kPaddingItems),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width / 1.32,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("${_controller.cartItem[index].item.tenThucuong.toTitleCase()}"),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Size ${_controller.cartItem[index].size}",
                                                            style: kStyleSize_OneCartItem,
                                                          ),
                                                          Text(
                                                            "Có sẵn",
                                                            style: kStyleNote_OneCartItem,
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "${currencyFormatter.format(_controller.cartItem[index].total).toString()}₫",
                                                          style: kStyleTotal_OneCartItem,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  buildDivider(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault),
                    height: 120,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          "Giá bán đã bao gồm 8% VAT, áp dụng từ ngày 01/02/2022 đến 31/12/2022",
                          style: kStyleVAT,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tạm tính",
                              style: kStyleSubTotal,
                            ),
                            Text(
                              "${currencyFormatter.format(_controller.totalOnBill).toString()}₫",
                              style: kStyleSubTotal,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tổng cộng (${_controller.totalQuantity} món)",
                              style: kStyleTotal_OneCartItem,
                            ),
                            Text(
                              "${currencyFormatter.format(_controller.totalOnBill).toString()}₫",
                              style: kStyleTotal_OneCartItem,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(height: 80),
                ],
              ),
              Positioned.fill(
                top: 670,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    border: Border(
                      top: BorderSide(color: Colors.black26),
                    ),
                  ),
                  child: order_button(),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Divider buildDivider() {
    return const Divider(
      thickness: 1,
      indent: 0,
      endIndent: 0,
      height: 1,
      color: Color(0xffeaeaea),
    );
  }
}
