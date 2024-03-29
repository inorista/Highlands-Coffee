import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seemon/constants/color_constants.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/injection.dart';
import 'package:seemon/models/branch.dart';
import 'package:seemon/models/category.dart';
import 'package:seemon/models/promo.dart';
import 'package:seemon/models/product.dart';
import 'package:seemon/views/login/login_screen.dart';
import 'package:seemon/views/menu/components/bottom_sheet_change_method.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  // MAP CONTROLLER
  Completer<GoogleMapController> mapController = Completer();

  // CURRENT USER
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth? get auth => this._auth;

  late Future _futureHotProduct;
  late Future _futureAllProduct;
  late Future _futureAllPromo;
  Future get futureHotProduct => this._futureAllProduct;
  Future get futureAllProduct => this._futureAllProduct;
  Future get futureAllPromo => this._futureAllPromo;
  // List Category with products

  category ca_phe = new category(nameCategory: "cà phê", categoryProduct: []);
  category tranhietdoi = new category(nameCategory: "trà nhiệt đới", categoryProduct: []);
  category tra = new category(nameCategory: "trà", categoryProduct: []);
  category freeze = new category(nameCategory: "freeze", categoryProduct: []);
  category banh = new category(nameCategory: "bánh ngọt", categoryProduct: []);
  late List<category> allCategory = [ca_phe, tranhietdoi, tra, freeze, banh];

  // Controller products, news, promos container.
  var tabIndex = 0;

  // Current Branch
  branch? currentBranch = null;

  // Controller của PageView
  late PageController _pageController;
  PageController get pageController => this._pageController;

  // Controller của TabBar
  late TabController _tabController;
  TabController get tabController => this._tabController;

  // Firestore access hot product
  final db_hotproduct = FirebaseFirestore.instance.collection("products");
  final db_promo = FirebaseFirestore.instance.collection("promo");
  final db_branches = FirebaseFirestore.instance.collection("branches");

  Stream<QuerySnapshot>? db_process;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? db_getPoint;

  // List thức uống nổi bật
  List<product> dataThucuongHot = [];
  List<product> listAllProduct = [];
  List<khuyenmai> listAllPromo = [];
  List<branch> listBranch = [];

  @override
  void onInit() async {
    fetchDataBranch();
    _pageController = PageController();
    _futureHotProduct = fetchDataHotProduct();
    _futureAllProduct = fetchAllProduct();
    _futureAllPromo = fetchDataPromo();
    allCategory = [ca_phe, tranhietdoi, tra, freeze, banh];
    _tabController = TabController(length: allCategory.length, vsync: this);
    _auth.authStateChanges().listen((User? user) {
      _auth.currentUser?.reload();
      update();
    });
    db_process = await FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser?.phoneNumber)
        .collection("processing")
        .orderBy("createdAt", descending: true)
        .snapshots();

    db_getPoint = await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser?.phoneNumber).snapshots();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
    _tabController.dispose();
  }

  void updateUI() async {
    _auth.currentUser?.reload();
    update();
  }

  Future fetchDataHotProduct() async {
    ////STAGE 1 get HOTPRODUCT
    dataThucuongHot = [];

    QuerySnapshot<Map<String, dynamic>> datafromDB =
        await db_hotproduct.orderBy('theloai', descending: true).limit(6).get();
    final tempData = await datafromDB.docs.map((e) => e.data()).toList();
    dataThucuongHot = await tempData
        .map(
          (data) => product(
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
          (data) => product(
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

  Future fetchDataPromo() async {
    listAllPromo = [];
    QuerySnapshot<Map<String, dynamic>> datafromDB_promo = await db_promo.get();
    final tempDataPromo = await datafromDB_promo.docs.map((e) => e.data()).toList();

    listAllPromo = await tempDataPromo
        .map(
          (data) => khuyenmai(
            anh_khuyenmai: data["anh_khuyenmai"],
            dieukien_khuyenmai: data["dieukien_khuyenmai"],
            id_khuyenmai: data["id_khuyenmai"],
            mota_khuyenmai: data["mota_khuyenmai"],
            tieude_khuyenmai: data["tieude_khuyenmai"],
          ),
        )
        .toList();

    return listAllPromo;
  }

  void fetchDataBranch() async {
    listBranch = [];
    QuerySnapshot<Map<String, dynamic>> datafromDB_branch = await db_branches.get();
    final tempDataBranch = await datafromDB_branch.docs.map((e) => e.data()).toList();

    listBranch = await tempDataBranch
        .map(
          (data) => branch(
            branchName: data["branchName"],
            branchAddress: data["branchAddress"],
            branchLatitude: data["branchLatitude"],
            branchLongitude: data["branchLongitude"],
          ),
        )
        .toList();
    currentBranch = listBranch[0];
    update();
  }

  void showLoginPage(BuildContext context) {
    showCupertinoModalBottomSheet(
      expand: true,
      animationCurve: Curves.fastOutSlowIn,
      context: context,
      builder: (BuildContext context) => LoginScreen(),
    );
  }

  void showChangeMethodBottomSheet(context) async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      useRootNavigator: true,
      backgroundColor: Color(0xfffefefe),
      context: context,
      builder: (context) => bottom_sheet_change_method(),
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

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await _auth.currentUser?.reload();
    update();
  }

  void addPromo(khuyenmai crPromo) async {
    try {
      await db_promo.add({
        "id_khuyenmai": crPromo.id_khuyenmai,
        "anh_khuyenmai": crPromo.anh_khuyenmai,
        "tieude_khuyenmai": crPromo.tieude_khuyenmai,
        "mota_khuyenmai": crPromo.mota_khuyenmai,
        "dieukien_khuyenmai": crPromo.dieukien_khuyenmai,
      });
    } catch (e) {
      print("Lỗi ${e}");
    }
  }

  void addBranch(branch chinhanh) async {
    try {
      await db_branches.doc(chinhanh.branchName).set({
        "branchName": chinhanh.branchName,
        "branchAddress": chinhanh.branchAddress,
        "branchLatitude": chinhanh.branchLatitude,
        "branchLongitude": chinhanh.branchLongitude,
      });
    } catch (e) {
      print("Lỗi ${e}");
    }
  }

  void changeBranchAndAnime(branch selectedBranch) async {
    currentBranch = selectedBranch;
    update();
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            selectedBranch.branchLatitude,
            selectedBranch.branchLongitude,
          ),
          zoom: 16,
        ),
      ),
    );
    update();
  }
}
