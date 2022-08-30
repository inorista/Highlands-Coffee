import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_controller) {
        final currentPhone = _controller.auth?.currentUser!.phoneNumber;
        final db_process = FirebaseFirestore.instance.collection("users").doc(currentPhone).collection("history");
        return StreamBuilder<QuerySnapshot>(
          stream: db_process.snapshots(),
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
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.black,
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
