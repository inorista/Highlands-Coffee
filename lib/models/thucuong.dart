import 'package:flutter/material.dart';

class thucuong {
  final String tenThucuong;
  final List<String> listSize;
  final List<num> listPrice;
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

thucuong bac_xiu_da = new thucuong(
  tenThucuong: "bạc xỉu đá",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FBac_Xiu_Da.png?alt=media&token=f34f5458-2267-4bfa-83ce-91d39959017f",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 39000, 45000],
);

thucuong phin_sua_nong = new thucuong(
  tenThucuong: "phin sữa nóng",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FPHIN-SUA-NONG.png?alt=media&token=9fa5fab1-1865-4d32-b455-6c658fb89072",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 39000, 45000],
);

thucuong phin_den_da = new thucuong(
  tenThucuong: "phin đen đá",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FCFD%20(1).png?alt=media&token=cf4d5018-bbf6-4dac-8d39-2b557e1dde05",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 35000, 39000],
);

thucuong phin_den_nong = new thucuong(
  tenThucuong: "phin đen nóng",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FAMERICANO.png?alt=media&token=90ece1cc-76b0-40c4-acb8-0be7b10ab660",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 35000, 39000],
);

thucuong caramel_macchiato = new thucuong(
  tenThucuong: "caramel macchiato",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FCARAMEL-MACCHIATO.png?alt=media&token=f608baf0-4391-4401-a816-ee40e2c8d3d6",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [69000, 79000, 85000],
);

thucuong mocha_macchiato = new thucuong(
  tenThucuong: "mocha macchiato",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FMOCHA.png?alt=media&token=fe5ec0c6-955a-4fcc-8138-ce0b07d6c692",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [69000, 79000, 85000],
);

thucuong espresso = new thucuong(
  tenThucuong: "espresso",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FESPRESSO.png?alt=media&token=4638e713-7fae-4175-9463-b96f6fc510c8",
  theloai: "cà phê",
  listSize: ["S", "M", "L"],
  listPrice: [45000, 49000, 55000],
);
thucuong cookies_cream = new thucuong(
  tenThucuong: "cookies & cream",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FCOOKIES-CREAM.png?alt=media&token=640255d3-55fb-4638-92e4-cce94141b3f6",
  theloai: "freeze",
  listSize: ["S", "M", "L"],
  listPrice: [55000, 65000, 69000],
);

thucuong freeze_chocolate = new thucuong(
  tenThucuong: "freeze sô-cô-la",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FCHOCOLATE-FREEZE.png?alt=media&token=1f4031c3-cf36-4fb0-8a10-db7096c6257d",
  theloai: "freeze",
  listSize: ["S", "M", "L"],
  listPrice: [55000, 65000, 69000],
);

thucuong freeze_traxanh = new thucuong(
  tenThucuong: "freeze trà xanh",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FGTF.png?alt=media&token=9a4d1480-9d38-4b36-ae1c-6f4b9057cd23",
  theloai: "freeze",
  listSize: ["S", "M", "L"],
  listPrice: [55000, 65000, 69000],
);

thucuong banh_chuoi = new thucuong(
  tenThucuong: "bánh chuối",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FBANHCHUOI.jpg?alt=media&token=e8d00ead-bfe6-494e-b5f4-0210e26b5c59",
  theloai: "bánh ngọt",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 39000, 45000],
);

thucuong banh_mousse_cacao = new thucuong(
  tenThucuong: "bánh mousse cacao",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FMOUSSECACAO.png?alt=media&token=b2763087-3e03-4fec-a1e0-6e7d2e77e0be",
  theloai: "bánh ngot",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 39000, 45000],
);

thucuong banh_mousse_dao = new thucuong(
  tenThucuong: "bánh mousse đào",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FMOUSSEDAO.png?alt=media&token=9eb3aa65-442a-4cd4-8202-c842a5d37f82",
  theloai: "bánh ngot",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 39000, 45000],
);

thucuong banh_phomai_caphe = new thucuong(
  tenThucuong: "bánh phô mai cà phê",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FPHOMAICAPHE.jpg?alt=media&token=71aefc1b-62ed-48b0-a3ff-7b7f58c78e79",
  theloai: "bánh ngot",
  listSize: ["S", "M", "L"],
  listPrice: [29000, 39000, 45000],
);

thucuong tra_xoai_nhiet_doi = new thucuong(
  tenThucuong: "trà xoài nhiệt đới",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FTRA-XOAI-NHIET-DOI.jpg?alt=media&token=f4ad912a-13b8-4979-81ce-87c10b910762",
  theloai: "trà nhiệt đới",
  listSize: ["S", "M", "L"],
  listPrice: [55000, 59000, 65000],
);

thucuong tra_mo_sori = new thucuong(
  tenThucuong: "trà mơ sơ ri",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FTRA-MO-SORI.jpg?alt=media&token=a24f031c-6d86-4036-8fe5-b4fc30417061",
  theloai: "trà nhiệt đới",
  listSize: ["S", "M", "L"],
  listPrice: [55000, 59000, 65000],
);

thucuong tra_oi_hong = new thucuong(
  tenThucuong: "trà ổi hòng",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2Foi-hong.png?alt=media&token=95a59386-e277-42e5-9581-2cce565c72ec",
  theloai: "trà nhiệt đới",
  listSize: ["S", "M", "L"],
  listPrice: [55000, 59000, 65000],
);

thucuong banh_socola_highlands = new thucuong(
  tenThucuong: "bánh sô-cô-la highlands",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FSOCOLAHL-removebg-preview.png?alt=media&token=794a2d91-31ab-4417-b9f7-e555c3f972ab",
  theloai: "bánh ngot",
  listSize: ["S", "M", "L"],
  listPrice: [35000, 39000, 45000],
);

thucuong banh_phomai_chanhday = new thucuong(
  tenThucuong: "bánh phô mai chanh dây",
  anhThucuong:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/products%2FPHOMAICHANHDAY-removebg-preview.png?alt=media&token=a46c72c7-46b3-4c91-914d-a8ed14d0269f",
  theloai: "bánh ngot",
  listSize: ["S", "M", "L"],
  listPrice: [35000, 39000, 45000],
);
