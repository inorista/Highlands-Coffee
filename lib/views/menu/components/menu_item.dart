import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/models/product.dart';
import 'package:intl/intl.dart';
import 'package:seemon/views/detail_product/detail_screen.dart';

class menu_item extends StatelessWidget {
  const menu_item({
    Key? key,
    required this.crProduct,
  }) : super(key: key);

  final product crProduct;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailScreen(
            thucuong: crProduct,
            specialKey: "menu",
          ),
        );
      },
      child: Hero(
        tag: crProduct.anhThucuong + "menu",
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 3,
                  offset: const Offset(-0.5, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 170,
                      color: Color(0xfff7f1e8),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: crProduct.anhThucuong,
                          height: 170,
                          placeholder: (context, url) => Center(
                            child: Image.asset(
                              "assets/images/skeleton.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                  child: Text(
                    crProduct.tenThucuong.toTitleCase(),
                    style: kStyleMenuItemName,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                  child: Text(
                    "${currencyFormatter.format(crProduct.listPrice[0].toDouble())}₫",
                    style: kStyleMenuItemPrice,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
