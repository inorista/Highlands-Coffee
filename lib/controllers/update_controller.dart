import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/injection.dart';
import 'package:seemon/models/user.dart';
import 'package:seemon/views/other/gender_bottomsheet.dart';
import 'package:seemon/views/pinput/components/confirm_button.dart';

class UpdateController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController sdt;
  late TextEditingController gender;

  late bool _isChanged;
  bool get isChanged => _isChanged;

  List<String> listGender = ["Nam", "Nữ", "Không đề cập"];

  String phoneNumber = "";
  String userName = "";
  String userEmail = "";
  String userGender = "";
  int currentIndex = 0;

  final _userPhoneNumber = locator.get<HomeController>().auth?.currentUser?.phoneNumber;
  late StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> userStream;

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    sdt = TextEditingController();
    gender = TextEditingController();

    _isChanged = false;
    final temp = locator.get<HomeController>().auth!.currentUser!.phoneNumber!.toString();
    for (int i = 0; i < temp.length; i++) {
      if (i == 2 || i == 5 || i == 8) {
        phoneNumber = phoneNumber + temp[i] + " ";
      } else {
        phoneNumber = phoneNumber + temp[i];
      }
    }

    userStream = FirebaseFirestore.instance.collection("users").doc("${_userPhoneNumber}").snapshots().listen((event) {
      userName = event.data()!['hoten'];
      userEmail = event.data()!['email'];
      userGender = event.data()!['gioitinh'];

      setCurrentInfo();
    });
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    sdt.dispose();
    gender.dispose();
    super.onClose();
  }

  void setCurrentInfo() async {
    if (userName != null || userName != "") {
      name.text = userName;
    }
    if (userEmail != null || userEmail != "") {
      email.text = userEmail;
    }
    if (userGender != null || userGender != "") {
      gender.text = userGender;
    }
    try {
      currentIndex = listGender.indexOf(userGender);
      print(currentIndex);
    } catch (e) {
      currentIndex = 0;
    }
  }

  void setOnSaveButton(String change) async {
    _isChanged = true;
    update();
  }

  Future<void> updateUserInfo() async {
    await FirebaseFirestore.instance.collection("users").doc("${_userPhoneNumber}").update({
      'email': email.text,
      'hoanthanhhoso': true,
      'hoten': name.text,
      'gioitinh': gender.text,
    });
    print("UPDATED");
  }

  void showGenderPicker(context) async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      useRootNavigator: true,
      backgroundColor: Color(0xfffefefe),
      context: context,
      builder: (context) => GenderPicker(),
    );
  }

  void changeGender(int index) {
    currentIndex = index;
    gender.text = listGender[currentIndex];
    update();
  }
}
