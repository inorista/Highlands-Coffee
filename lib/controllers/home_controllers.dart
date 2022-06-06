import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:seemon/models/thucuong.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  // Controller products, news, promos container.
  var tabIndex = 0;
  // Controller của PageView
  late PageController _pageController;
  PageController get pageController => this._pageController;

  // Firestore access
  final db_product = FirebaseFirestore.instance.collection("products");

  // List thức uống nổi bật
  late List<thucuong> dataThucuong;

  @override
  void onInit() async {
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  Future fetchData() async {
    dataThucuong = [];
    QuerySnapshot<Map<String, dynamic>> datafromDB = await db_product.limit(3).get();
    final tempData = await datafromDB.docs.map((e) => e.data()).toList();
    dataThucuong = await tempData
        .map(
          (data) => thucuong(
            tenThucuong: data["tenThucuong"],
            anhThucuong: data["anhThucuong"],
            theloai: data["theloai"],
            listSize: data["listSize"].cast<String>(),
            listPrice: data["listPrice"].cast<num>(),
          ),
        )
        .toList();
    return dataThucuong;
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void add(String tenThucuong, String anhThucuong, String theloai, List listSize, List listPrice) async {
    try {
      await db_product.add({
        "tenThucuong": tenThucuong,
        "anhThucuong": anhThucuong,
        "theloai": theloai,
        "listSize": listSize,
        "listPrice": listPrice,
      });
    } catch (e) {
      print("Lỗi ${e}");
    }
  }
}
