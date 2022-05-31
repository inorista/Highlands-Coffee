import 'package:flutter/material.dart';

class thucuong {
  final String tenThucuong;
  final List<String> listSize;
  final List<double> listPrice;
  final String anhThucuong;
  final String theloai;
  thucuong({
    required this.tenThucuong,
    required this.anhThucuong,
    required this.theloai,
    required this.listSize,
    required this.listPrice,
  });
}

thucuong tra_sen_vang = new thucuong(
  tenThucuong: "trà sen vàng",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FTRASENVANG.png?alt=media&token=98a03fe3-4b0e-44ea-a80c-b293e708e983",
  theloai: "trà",
  listSize: ["S", "M", "L"],
  listPrice: [39000, 49000, 55000],
);

thucuong tra_thach_dao = new thucuong(
  tenThucuong: "trà thạch đào",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FTRATHACHDAO.png?alt=media&token=c010f349-4b09-4040-84f2-9bcba528737e",
  theloai: "trà",
  listSize: ["S", "M", "L"],
  listPrice: [39000, 49000, 55000],
);

thucuong tra_thanh_dao = new thucuong(
  tenThucuong: "trà thanh đào",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FTRATHANHDAO.png?alt=media&token=4640e0b2-3c99-49eb-b7a0-f2b99d077213",
  theloai: "trà",
  listSize: ["S", "M", "L"],
  listPrice: [39000, 49000, 55000],
);

thucuong tra_thach_vai = new thucuong(
  tenThucuong: "trà thạch vải",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FTRATHACHVAI_1.png?alt=media&token=97e580c0-cb17-4161-986b-2168475b2f95",
  theloai: "trà",
  listSize: ["S", "M", "L"],
  listPrice: [39000, 49000, 55000],
);
thucuong caramel_freeze = new thucuong(
  tenThucuong: "caramel phin freeze",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2Fpng.png?alt=media&token=5c291917-03ba-4ff9-9c18-aea360443e2a",
  theloai: "freeze",
  listSize: ["S", "M", "L"],
  listPrice: [49000, 59000, 65000],
);
