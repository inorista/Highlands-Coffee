import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';

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
            onTap: () {},
            child: Text("Tất Cả", style: kStyleSeeAll),
          ),
        ],
      ),
    );
  }
}
