import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:intl/intl.dart';

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
        final db_process = FirebaseFirestore.instance.collection("users").doc(currentPhone).collection("processing");

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
                      Text("Đặt món và thưởng thức thôi nào"),
                    ],
                  ),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final status = snapshot.data?.docs[index]["status"];
                  final timeCreated = DateFormat("d, MMM").format(snapshot.data?.docs[index]["createdAt"].toDate());

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPaddingDefault, vertical: kPaddingDefault / 1.5),
                    child: Container(
                      padding: const EdgeInsets.all(kPaddingItems),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(1, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 13,
                                width: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: kCommonCartColor,
                                ),
                                child: Center(
                                  child: const Icon(
                                    EvaIcons.checkmark,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: kPaddingSize),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${status}", style: kStyleSize_OneCartItem),
                                    Text(" · ", style: kStyleDot),
                                    Text("${timeCreated}", style: kStyleDate),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
