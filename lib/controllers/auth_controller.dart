import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/injection.dart';

import 'package:seemon/views/pinput/pinput_screen.dart';
import 'dart:math';

class AuthController extends GetxController {
  //Current user
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;

  final User? _user = FirebaseAuth.instance.currentUser;
  User? get user => _user;
  //Check if user accepted License ?
  bool _isAcceptLicense = false;
  bool get isAcceptLicense => _isAcceptLicense;

  //Text Length ?
  int _textLength = 0;
  int get textLength => _textLength;

  //Init border Color
  String _statsInputBorder = "normal";
  String get statsInputBorder => _statsInputBorder;

  //String Phone
  String _currentPhone = "0";
  String get currentPhone => _currentPhone;

  //String verificationID
  String _verificationID = "";
  String get verificationID => _verificationID;

  //PIN Code
  String pincode = "";

  //RANDOM ID
  var rng = new Random();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _statsInputBorder = "normal";
    _textLength = 0;
    _isAcceptLicense = false;
    _currentPhone = "0";
    pincode = "";
    _verificationID = "";

    super.onClose();
  }

  void updateTextLength(String text) {
    _textLength = text.length;
    _currentPhone = text;
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
    if (_textLength < 9 && _textLength != 0) {
      _statsInputBorder = "incorrect";
    } else if (_textLength >= 9) {
      _statsInputBorder = "correct";
    } else if (_textLength == 0) {
      _statsInputBorder = "normal";
    }
    update();
  }

  bool checkingAuthPhone() {
    if (_currentPhone[0] == "0" && _currentPhone.length > 9) {
      _currentPhone = _currentPhone.substring(1, _currentPhone.length);
      return true;
    } else if (_currentPhone.length > 9 && _currentPhone[0] != "0") {
      return false;
    } else if (_currentPhone.length < 9) {
      return false;
    } else if (_currentPhone.length == 9 && _currentPhone[0] == "0") {
      return false;
    }
    return true;
  }

  void showPinInputPage(BuildContext context) {
    showCupertinoModalBottomSheet(
      isDismissible: false,
      expand: true,
      context: context,
      builder: (context) => const PinputScreen(),
    );
    update();
  }

  void signingwithPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+84 ${_currentPhone}",
      verificationCompleted: (AuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        _verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    await _auth.currentUser?.reload();
    update();
  }

  void createDocumentUser(String phoneNumber) async {
    try {
      final documentID = await FirebaseFirestore.instance.collection("users").doc("+84${phoneNumber}").get();
      if (!documentID.exists) {
        final userID = rng.nextInt(89999999) + 10000000;
        await FirebaseFirestore.instance.collection("users").doc("+84${phoneNumber}").set({
          'userid': userID,
          'email': "",
          'gioitinh': "",
          'hoanthanhhoso': false,
          'hoten': "",
          'point': 0,
          'sodienthoai': "",
          'level': 1,
        });
      }
    } catch (e) {
      print("Lỗi ${e}");
    }
  }

  void updateInfomationUser(String phoneNumber, String email, String gioitinh, String hoten) async {
    final documentID = await FirebaseFirestore.instance.collection("users").doc("+84${phoneNumber}");
    try {
      await documentID.update(
        {
          'email': email,
          'gioitinh': gioitinh,
          'hoten': hoten,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifyCode(String pinCode) async {
    PhoneAuthCredential phoneAuthCredential = await PhoneAuthProvider.credential(
      verificationId: _verificationID,
      smsCode: pinCode,
    );
    await _auth.signInWithCredential(phoneAuthCredential);

    if (_auth.currentUser != null) {
      locator.get<HomeController>().auth?.currentUser?.reload();
      locator.get<HomeController>().update();
      createDocumentUser(_currentPhone);
    }
    _auth.currentUser?.reload();
    update();
  }
}
