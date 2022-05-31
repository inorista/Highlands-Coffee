import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:seemon/models/thucuong.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:intl/intl.dart';
import 'package:seemon/views/details/components/options.dart';

// Price Format

class DetailScreen extends GetWidget {
  const DetailScreen({Key? key, this.thucuong}) : super(key: key);
  final thucuong;
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');

    return Scaffold(
      backgroundColor: Color(0xffF8F1E7),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DismissiblePage(
          backgroundColor: Color(0xffFEF5E8),
          onDismissed: () => Get.back(),
          direction: DismissiblePageDismissDirection.down,
          isFullScreen: true,
          dragSensitivity: 0.3,
          minScale: 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: MediaQuery.of(context).size.height * 0.7,
                child: SizedBox(
                  child: Hero(
                    tag: thucuong.tenThucuong,
                    child: Container(
                      padding: EdgeInsets.all(kPaddingDefault * 1.5),
                      color: const Color(0xffF8F1E7),
                      child: Image.network(
                        thucuong.anhThucuong,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.74,
                  minChildSize: 0.74,
                  maxChildSize: 0.85,
                  builder: (context, scrollController) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          child: Padding(
                            padding: EdgeInsets.all(kPaddingDefault),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      thucuong.tenThucuong.toString().toTitleCase(),
                                      style: kStyleDetailName_Price,
                                    ),
                                    Text(
                                      "${currencyFormatter.format(thucuong.listPrice[0]).toString()}₫",
                                      style: kStyleDetailName_Price,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: kPaddingItems),
                                  child: Text(
                                    "Giá bán đã bao gồm 8% VAT, áp dụng từ ngày 01/02/2022\nđến 31/12/2022",
                                    style: kStyleVAT,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      thucuong.listPrice.length,
                                      (index) => options(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  iconSize: 26,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    EvaIcons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
