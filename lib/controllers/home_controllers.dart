import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seemon/models/category.dart';
import 'package:seemon/models/thucuong.dart';
import 'package:seemon/views/login/login_screen.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late Future _futureHotProduct;
  late Future _futureAllProduct;
  Future get futureHotProduct => this._futureAllProduct;
  Future get futureAllProduct => this._futureAllProduct;
  // List Category with products
  late List<thucuong> listAllProduct;
  category ca_phe = new category(nameCategory: "cà phê", categoryProduct: []);
  category tranhietdoi = new category(nameCategory: "trà nhiệt đới", categoryProduct: []);
  category tra = new category(nameCategory: "trà", categoryProduct: []);
  category freeze = new category(nameCategory: "freeze", categoryProduct: []);
  category banh = new category(nameCategory: "bánh ngọt", categoryProduct: []);
  late List<category> allCategory = [ca_phe, tranhietdoi, tra, freeze, banh];

  // Controller products, news, promos container.
  var tabIndex = 0;
  // Controller của PageView
  late PageController _pageController;
  PageController get pageController => this._pageController;

  late TabController _tabController;
  TabController get tabController => this._tabController;
  // Firestore access hot product
  final db_hotproduct = FirebaseFirestore.instance.collection("products");
  final db_promo = FirebaseFirestore.instance.collection("promo");
  // List thức uống nổi bật
  late List<thucuong> dataThucuongHot;

  @override
  void onInit() async {
    _pageController = PageController();
    _futureHotProduct = fetchDataHotProduct();
    _futureAllProduct = fetchAllProduct();
    allCategory = [ca_phe, tranhietdoi, tra, freeze, banh];
    _tabController = TabController(length: allCategory.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
    _tabController.dispose();
  }

  Future fetchDataHotProduct() async {
    ////STAGE 1 get HOTPRODUCT
    dataThucuongHot = [];

    QuerySnapshot<Map<String, dynamic>> datafromDB =
        await db_hotproduct.orderBy('theloai', descending: false).limit(6).get();
    final tempData = await datafromDB.docs.map((e) => e.data()).toList();
    dataThucuongHot = await tempData
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
    return dataThucuongHot;
  }

  Future fetchAllProduct() async {
    ////STAGE 2 get ALL PRODUCT
    listAllProduct = [];
    QuerySnapshot<Map<String, dynamic>> datafromDB_all = await db_hotproduct.get();
    final tempAllData = await datafromDB_all.docs.map((e) => e.data()).toList();
    listAllProduct = await tempAllData
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
    for (int i = 0; i < listAllProduct.length; i++) {
      if (listAllProduct[i].theloai == "cà phê") {
        ca_phe.categoryProduct.add(listAllProduct[i]);
      }
      if (listAllProduct[i].theloai == "trà nhiệt đới") {
        tranhietdoi.categoryProduct.add(listAllProduct[i]);
      }
      if (listAllProduct[i].theloai == "trà") {
        tra.categoryProduct.add(listAllProduct[i]);
      }
      if (listAllProduct[i].theloai == "freeze") {
        freeze.categoryProduct.add(listAllProduct[i]);
      }
      if (listAllProduct[i].theloai == "bánh ngọt") {
        banh.categoryProduct.add(listAllProduct[i]);
      }
    }
    allCategory = [ca_phe, tranhietdoi, tra, freeze, banh];
    return allCategory;
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

  void add(thucuong) async {
    try {
      await db_hotproduct.add({
        "tenThucuong": thucuong.tenThucuong,
        "anhThucuong": thucuong.anhThucuong,
        "theloai": thucuong.theloai,
        "listSize": thucuong.listSize,
        "listPrice": thucuong.listPrice,
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
