import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/views/allpromo/all_promo_screen.dart';

class promo_seeAll extends StatelessWidget {
  const promo_seeAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPaddingDefault),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Ưu Đãi Đặc Biệt Hôm Nay", style: kStyleCategory),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: Colors.black.withOpacity(0.1),
            splashColor: Colors.black.withOpacity(0.1),
            onTap: () {
              Get.to(
                () => AllPromoScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Text("Tất Cả", style: kStyleSeeAll),
          ),
        ],
      ),
    );
  }
}
