import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:seemon/controllers/detail_controllers.dart';
import 'package:seemon/models/thucuong.dart';
import 'package:seemon/constants/string_format.dart';
import 'package:intl/intl.dart';
import 'package:seemon/views/detail/components/add_button.dart';
import 'package:seemon/views/detail/components/minus_button.dart';
import 'package:seemon/views/detail/components/options.dart';
import 'package:seemon/views/detail/components/plus_button.dart';
import 'package:seemon/views/detail/components/quantity_text.dart';

// Price Format

class DetailScreen extends GetWidget {
  const DetailScreen({Key? key, this.thucuong}) : super(key: key);
  final thucuong;
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat('###,000', 'ID');
    DetailController _controller = Get.put(DetailController());
    _controller.getThucuong(thucuong);
    return Scaffold(
      backgroundColor: Color(0xffF8F1E7),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DismissiblePage(
          backgroundColor: Color(0xffFEF5E8),
          onDismissed: () => Get.back(),
          direction: DismissiblePageDismissDirection.down,
          isFullScreen: true,
          dragSensitivity: 0.4,
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
                                      "${currencyFormatter.format(thucuong.listPrice[0].toDouble())}₫",
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
                                      thucuong.listSize.length,
                                      (i) => options(
                                        index: i,
                                        size: thucuong.listSize[i],
                                        press: () => _controller.onChangeIndex(i, thucuong),
                                        thucuong: thucuong,
                                        fixedPrice: thucuong.listPrice[i].toDouble(),
                                      ),
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
              Positioned.fill(
                top: MediaQuery.of(context).size.height / 1.3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.black26),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.2,
                        blurRadius: 4,
                        offset: const Offset(0, -0.1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(flex: 4),
                          minus_button(),
                          Spacer(),
                          quantity_text(),
                          Spacer(),
                          plus_button(),
                          Spacer(flex: 4),
                        ],
                      ),
                      Spacer(),
                      add_button(),
                      Spacer(),
                    ],
                  ),
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
