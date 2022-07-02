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

  //Init border Color
  String _statsInputBorder = "normal";
  String get statsInputBorder => this._statsInputBorder;

  //

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _statsInputBorder = "normal";
    _textLength = 0;
    _isAcceptLicense = false;
    super.onClose();
  }

  void updateTextLength(String textLength) {
    _textLength = textLength.length;
    update();
  }

  void onClickAcceptLicense() {
    if (_isAcceptLicense) {
      _isAcceptLicense = false;
    } else if (!_isAcceptLicense) {
      _isAcceptLicense = true;
    }
    update();
  }

  void checkingPhoneAndUpdateUI() {
    if (_textLength < 9 && _textLength > 0) {
      _statsInputBorder = "incorrect";
    } else if (_textLength > 9) {
      _statsInputBorder = "correct";
    } else if (_textLength == 0) {
      _statsInputBorder = "normal";
    }
    update();
  }
}
