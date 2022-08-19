import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/detail_promo/detail_promo_screen.dart';

class AllPromoScreen extends StatelessWidget {
  const AllPromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        return Scaffold(
          backgroundColor: Color(0xffeaeaea),
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                EvaIcons.arrowIosBack,
                size: 30,
                color: Color(0xff666666),
              ),
            ),
            centerTitle: true,
            title: Text(
              "Tất Cả Ưu Đãi",
              style: kStyleTitleAppbar_Order,
            ),
            backgroundColor: Colors.white,
            elevation: 4,
            shadowColor: Color(0xffdcdcdc),
            toolbarHeight: 60,
          ),
          body: ListView.builder(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: _controller.listAllPromo.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) => Padding(
              padding: EdgeInsets.all(kPaddingDefault),
              child: GestureDetector(
                onTap: () => Get.to(
                  () => DetailPromoScreen(crPromo: _controller.listAllPromo[index]),
                ),
                child: Hero(
                  tag: _controller.listAllPromo[index].anh_khuyenmai,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(-2, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(kPaddingItems),
                                color: Color(0xffc61c27),
                                width: double.infinity,
                                height: 180,
                                child: CachedNetworkImage(
                                  imageUrl: _controller.listAllPromo[index].anh_khuyenmai,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: kPaddingDefault,
                              left: kPaddingDefault,
                            ),
                            child: Text(
                              "${_controller.listAllPromo[index].tieude_khuyenmai}",
                              style: kStyleTitlePromo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
