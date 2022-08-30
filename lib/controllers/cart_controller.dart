import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seemon/models/cart.dart';
import 'package:seemon/models/product.dart';

class CartController extends GetxController {
  final auth = FirebaseAuth.instance.currentUser;
  var cartItem = List<CartItem>.empty().obs;
  var totalQuantity = 0;
  num totalOnBill = 0;
  var rng = new Random();
  Future<void> addToCart(product item, int quantity, String size, num total) async {
    final index =
        cartItem.indexWhere((element) => element.item.tenThucuong == item.tenThucuong && element.size == size);
    //// Nếu món đã có sẵn trong cart => update quantity, total.
    if (index != -1) {
      cartItem[index] = CartItem(
        item: item,
        size: size,
        quantity: (quantity + cartItem[index].quantity),
        total: (total + cartItem[index].total),
      );
    } else {
      //// Nếu món đã có sẵn trong cart => chỉ update quantity
      cartItem.add(
        CartItem(
          item: item,
          quantity: quantity,
          size: size,
          total: total,
        ),
      );
    }

    updateQuantityandTotalBill();
  }

  void updateQuantityandTotalBill() {
    totalQuantity = cartItem.fold(0, (quantity, item) => quantity + item.quantity);
    totalOnBill = cartItem.fold(0, (total, item) => total + item.total.toInt());
    update();
  }

  Future<void> cleanCart() async {
    cartItem.value = [];
    totalQuantity = 0;
    totalOnBill = 0;
    update();
  }

  Future<void> postOrder() async {
    final id_order = "HC${rng.nextInt(89999999) + 10000000}";
    final postURL =
        await FirebaseFirestore.instance.collection("users").doc(auth?.phoneNumber).collection("processing");
    try {
      postURL.add({
        "id_order": id_order,
        "total": totalOnBill,
        "quantity": totalQuantity,
        "cartItem": [
          ...List.generate(
              cartItem.length,
              (index) =>
                  "${cartItem[index].item.tenThucuong}, ${cartItem[index].size}, ${cartItem[index].quantity}, ${cartItem[index].total}")
        ],
        "status": "Đang chuẩn bị",
        "branch": "Highlands Coffee - Lê Văn Sỹ",
        "createdAt": FieldValue.serverTimestamp(),
      });
      cleanCart();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
