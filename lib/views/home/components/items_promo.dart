import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/models/promo.dart';
import 'package:seemon/views/detail_promo/detail_promo_screen.dart';

class items_promo extends StatelessWidget {
  const items_promo({
    Key? key,
    required this.crPromo,
  }) : super(key: key);
  final khuyenmai crPromo;
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
                  crPromo: crPromo,
                ),
              );
            },
            child: Hero(
              tag: crPromo.anh_khuyenmai,
              child: CachedNetworkImage(
                imageUrl: crPromo.anh_khuyenmai,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
