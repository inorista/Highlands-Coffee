import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/models/promo.dart';
import 'package:seemon/views/dashboard/dashboard_screen.dart';

class DetailPromoScreen extends StatelessWidget {
  const DetailPromoScreen({
    Key? key,
    required this.crPromo,
  }) : super(key: key);
  final khuyenmai crPromo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F1E7),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DismissiblePage(
          reverseDuration: Duration(milliseconds: 500), // Time animation khi ngắt dismiss
          startingOpacity: 0.5,
          backgroundColor: Color(0xffF8F1E7),
          behavior: HitTestBehavior.translucent,
          onDismissed: () => Get.back(), // Trở lại trang trước
          direction: DismissiblePageDismissDirection.down, // Animation scroll khi dismiss
          isFullScreen: false, // Chế độ fullscreen nếu 'true' thì ignore tất cả padding
          dragSensitivity: 0.6, // Độ nhạy của dismisspage khi trigger dismiss
          minScale: 0.4,
          child: Hero(
            tag: crPromo.anh_khuyenmai,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height * 2,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      color: const Color(0xffBD1721),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 0,
                            child: CachedNetworkImage(
                              imageUrl: crPromo.anh_khuyenmai,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 30,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                EvaIcons.close,
                                size: 30,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: kPaddingDefault),
                            child: Text(
                              crPromo.tieude_khuyenmai.toUpperCase(),
                              style: kStyleTitlePromo,
                            ),
                          ),
                          Text(
                            crPromo.mota_khuyenmai,
                            style: kStyleDescriptionPromo,
                            overflow: TextOverflow.visible,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: kPaddingDefault),
                            child: Text(
                              "Điều kiện áp dụng khuyến mãi:",
                              style: kStyleConditionApply,
                            ),
                          ),
                          ...List.generate(
                            crPromo.dieukien_khuyenmai.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: kPaddingSize),
                              child: Text(
                                "●    ${crPromo.dieukien_khuyenmai[index]}",
                                style: kStyleConditionText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
