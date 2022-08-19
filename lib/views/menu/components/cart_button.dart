import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/cart_controller.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/injection.dart';
import 'package:seemon/views/cart/cart_screen.dart';

class cart_button extends StatelessWidget {
  const cart_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.put(HomeController());
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (_controller) {
        if (_controller.cartItem.length > 0) {
          return Positioned(
            bottom: 30,
            right: 20,
            child: GestureDetector(
              onTap: () => {
                if (locator.get<HomeController>().auth?.currentUser != null)
                  {
                    Get.to(() => CartScreen(), transition: Transition.rightToLeft, curve: Curves.easeInCubic),
                  }
                else if (locator.get<HomeController>().auth?.currentUser == null)
                  {
                    _homeController.showLoginPage(context),
                  }
              },
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffc75759),
                          Color(0xffa73735),
                          Color(0xffa73735),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 5),
                          color: kColorCartButton, //edited
                          spreadRadius: 2,
                          blurRadius: 10, //edited
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/cart_icon.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffaff45e),
                            Color(0xff6cbe3c),
                            Color(0xff6cbe3c),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _controller.totalQuantity.toString(),
                          style: kStyleCartLength,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
