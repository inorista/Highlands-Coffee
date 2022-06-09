import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/views/detail_promo/detail_promo_screen.dart';

class items_promo extends StatelessWidget {
  const items_promo({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Color(0xffBD1721).withOpacity(1),
          child: InkWell(
            onTap: () {
              Get.to(
                () => DetailPromoScreen(
                  id_khuyenmai: id_khuyenmai,
                  anh_khuyenmai: anh_khuyenmai,
                  tieude_khuyenmai: tieude_khuyenmai,
                  mota_khuyenmai: mota_khuyenmai,
                  dieukien_khuyemai: dieukien_khuyemai,
                ),
              );
            },
            child: Image.network(
              anh_khuyenmai,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
