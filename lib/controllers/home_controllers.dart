import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seemon/models/thucuong.dart';
import 'package:seemon/views/login/login_screen.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  // Controller products, news, promos container.
  var tabIndex = 0;
  // Controller của PageView
  late PageController _pageController;
  PageController get pageController => this._pageController;

  // Firestore access
  final db_product = FirebaseFirestore.instance.collection("products");
  final db_promo = FirebaseFirestore.instance.collection("promo");
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
    QuerySnapshot<Map<String, dynamic>> datafromDB =
        await db_product.orderBy('theloai', descending: true).limit(3).get();
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

  void showLoginPage(context) {
    showCupertinoModalBottomSheet(
      animationCurve: Curves.fastOutSlowIn,
      context: context,
      builder: (context) => LoginScreen(),
    );
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

  void addPromo(
    String id_khuyenmai,
    String anh_khuyenmai,
    String tieude_khuyenmai,
    String mota_khuyenmai,
    List<String> dieukien_khuyemai,
  ) async {
    try {
      await db_promo.add({
        "id_khuyenmai": id_khuyenmai,
        "anh_khuyenmai": anh_khuyenmai,
        "tieude_khuyenmai": tieude_khuyenmai,
        "mota_khuyenmai": mota_khuyenmai,
        "dieukien_khuyemai": dieukien_khuyemai,
      });
    } catch (e) {
      print("Lỗi ${e}");
    }
  }
}
