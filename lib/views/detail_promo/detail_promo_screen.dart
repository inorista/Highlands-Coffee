import 'package:dismissible_page/dismissible_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/models/promo.dart';
import 'package:seemon/views/home/home_screen.dart';

class DetailPromoScreen extends StatelessWidget {
  const DetailPromoScreen({
    Key? key,
    required this.id_khuyenmai,
    required this.anh_khuyenmai,
    required this.tieude_khuyenmai,
    required this.mota_khuyenmai,
    required this.dieukien_khuyemai,
  }) : super(key: key);
  final String id_khuyenmai;
  final String anh_khuyenmai;
  final String tieude_khuyenmai;
  final String mota_khuyenmai;
  final List<dynamic> dieukien_khuyemai;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F1E7),
      resizeToAvoidBottomInset: false,
      body: Hero(
        tag: id_khuyenmai,
        child: SafeArea(
          child: DismissiblePage(
            reverseDuration: Duration(milliseconds: 500),
            startingOpacity: 0.5,
            backgroundColor: Colors.black26,
            behavior: HitTestBehavior.translucent,
            onDismissed: () => Get.back(),
            direction: DismissiblePageDismissDirection.down,
            isFullScreen: false,
            dragSensitivity: 0.6,
            minScale: 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: MediaQuery.of(context).size.height * 0.73,
                  child: SizedBox(
                    child: Container(
                      color: const Color(0xffBD1721),
                      child: Image.network(
                        anh_khuyenmai,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.24,
                  child: Container(
                    padding: EdgeInsets.all(kPaddingDefault),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tieude_khuyenmai.toUpperCase(),
                          style: kStyleTitlePromo,
                        ),
                        Spacer(),
                        Text(
                          mota_khuyenmai,
                          style: kStyleDescriptionPromo,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Điều kiện áp dụng khuyến mãi:",
                            style: kStyleConditionApply,
                          ),
                        ),
                        ...List.generate(
                          dieukien_khuyemai.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "●    ${dieukien_khuyemai[index]}",
                              style: kStyleConditionText,
                            ),
                          ),
                        ),
                        Spacer(flex: 5),
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
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
