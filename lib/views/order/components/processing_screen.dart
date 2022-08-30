import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:intl/intl.dart';
import 'package:seemon/models/order.dart';
import 'package:seemon/views/order/components/order_items.dart';

class ProcessingScreen extends StatelessWidget {
  const ProcessingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        final currentPhone = _controller.auth?.currentUser?.phoneNumber;
        return StreamBuilder<QuerySnapshot>(
          stream: _controller.db_process,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.length == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/order_empty.png",
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: kPaddingDefault),
                        child: Text("Đặt món và thưởng thức thôi nào", style: kStyleTotalOrderItems),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return order_items(
                    order: order.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>),
                  );
                },
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
