import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class promo_pageview extends GetWidget {
  const promo_pageview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return Container(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller.pageController,
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            //itemCount: 2,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingDefault),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/pw1.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 25,
            child: SmoothPageIndicator(
              controller: _controller.pageController,
              count: 1,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white, dotColor: Colors.grey, dotHeight: 3, dotWidth: 3, spacing: 2),
            ),
          ),
        ],
      ),
    );
  }
}
