import 'package:flutter/material.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/home/components/appbar.dart';
import 'package:seemon/views/home/components/hot_products_category.dart';
import 'package:seemon/views/home/components/introduce.dart';
import 'package:seemon/views/home/components/listview_hotproducts.dart';
import 'package:seemon/views/home/components/pageview_promo.dart';
import 'package:seemon/views/home/components/promo_see_all.dart';
import 'package:seemon/views/home/components/register_promo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return Scaffold(
      appBar: home_appbar(),
      body: Container(
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
                  padding: EdgeInsets.all(kPaddingDefault * 2),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/lastest_icon.png",
                          height: 40,
                          width: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: kPaddingDefault * 1.5),
                          child: Text(
                            "Tin cuối rồi. Bạn thật tuyệt vời",
                            style: kStyleFooterText,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
