import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/home/components/appbar.dart';
import 'package:seemon/views/home/components/hot_products_category.dart';
import 'package:seemon/views/home/components/introduce.dart';
import 'package:seemon/views/home/components/listview_hotproducts.dart';
import 'package:seemon/views/home/components/promo_pageview.dart';
import 'package:seemon/views/home/components/promo_see_all.dart';
import 'package:seemon/views/home/components/register_promo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class Body extends GetWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            introduce(),
            register_promo(),
            promo_seeAll(),
            promo_pageview(),
            hot_products(),
            listview_hot_products(controller: _controller),
            Padding(
              padding: EdgeInsets.all(kPaddingDefault),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
