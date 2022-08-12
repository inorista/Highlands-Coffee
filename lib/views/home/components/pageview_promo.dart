import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/detail_promo/detail_promo_screen.dart';
import 'package:seemon/views/home/components/items_promo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class promo_pageview extends StatelessWidget {
  const promo_pageview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return FutureBuilder(
      future: _controller.futureAllPromo,
      builder: (context, AsyncSnapshot sn) {
        if (sn.hasData) {
          return Container(
            height: 190,
            width: double.infinity,
            child: Stack(
              children: [
                PageView(
                  controller: _controller.pageController,
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  children: [
                    ...List.generate(
                      _controller.listAllPromo.length,
                      (index) => items_promo(
                        crPromo: _controller.listAllPromo[index],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 5,
                  right: 25,
                  child: SmoothPageIndicator(
                    controller: _controller.pageController,
                    count: _controller.listAllPromo.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Colors.white, dotColor: Colors.grey, dotHeight: 3, dotWidth: 3, spacing: 2),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
