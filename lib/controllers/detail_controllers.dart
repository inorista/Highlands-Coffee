import 'package:flutter/animation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:seemon/models/product.dart';

class DetailController extends GetxController with SingleGetTickerProviderMixin {
  // Config Animtion for Add Button
  late AnimationController _anController;
  late Animation<double> _animation;
  AnimationController get anController => this._anController;
  Animation<double> get animation => this._animation;

  // Init index
  int _selectedSize = 0;
  int get selectedSize => this._selectedSize;

  // Init price
  int _selectedPrice = 0;
  int get selectedPrice => this._selectedPrice;

  // Init quantity
  var quantity = 1.obs;

  // Init thucuong
  var total = 0.obs;
  var currentPrice = 0.obs;

  void getThucuong(product thucuong) {
    currentPrice.value = thucuong.listPrice[0].toInt();
    total.value = currentPrice.value * quantity.value;
    update();
  }

  void onChangeIndex(index, thucuong) async {
    _selectedPrice = index;
    _selectedSize = index;
    currentPrice.value = thucuong.listPrice[index].toInt();
    await _anController.reverse();
    total.value = currentPrice.value * quantity.value;
    await _anController.forward();
    update();
  }

  void increaseQuantity() async {
    quantity.value++;
    await _anController.reverse();
    total.value = currentPrice.value * quantity.value;
    await _anController.forward();

    update();
  }

  void decreaseQuantity() async {
    if (quantity.value == 1) {
      quantity.value == 1;
    } else {
      await _anController.reverse();
      quantity.value--;
    }
    total.value = currentPrice.value * quantity.value;
    await _anController.forward();
    update();
  }

  // onInit GetX
  @override
  void onInit() {
    // Init Animation Controller
    _anController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_anController)..addListener(() => update());
    _anController.forward();
    super.onInit();
  }

  // onClose GetX
  @override
  void onClose() {
    _selectedSize = 0;
    _selectedPrice = 0;
    quantity.value = 1;
    _anController.dispose();
    super.onClose();
  }

  void changeQuantity() {
    update();
  }
}
