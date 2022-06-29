import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with SingleGetTickerProviderMixin {
  //Current user
  User? _auth = FirebaseAuth.instance.currentUser;
  User? get auth => this._auth;

  //Check if user accepted License ?
  bool _isAcceptLicense = false;
  bool get isAcceptLicense => this._isAcceptLicense;

  //Text Length ?
  int _textLength = 0;
  int get textLength => this._textLength;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateTextLength(int textLength) {
    _textLength = textLength;
    print(_textLength);
    update();
  }

  void updateBorderColor() {}
}
