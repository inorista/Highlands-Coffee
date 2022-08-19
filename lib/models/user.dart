import 'package:flutter/material.dart';

class user {
  final String userid;
  final String email;
  final String gioitinh;
  final String hoten;
  final num point;
  final String sodienthoai;
  final bool hoanthanhhoso;
  user({
    required this.userid,
    required this.email,
    required this.gioitinh,
    required this.hoten,
    required this.point,
    required this.sodienthoai,
    required this.hoanthanhhoso,
  });
  Map<String, dynamic> toMap() {
    return {
      "userid": userid,
      "email": email,
      "gioitinh": gioitinh,
      "hoten": hoten,
      "point": point,
      "sodienthoai": sodienthoai,
      "hoanthanhhoso": hoanthanhhoso,
    };
  }
}
