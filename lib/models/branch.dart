// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class branch {
  String branchName;
  String branchAddress;
  double branchLatitude;
  double branchLongitude;

  branch({
    required this.branchName,
    required this.branchAddress,
    required this.branchLatitude,
    required this.branchLongitude,
  });

  branch copyWith({
    String? branchName,
    String? branchAddress,
    double? branchLatitude,
    double? branchLongitude,
  }) {
    return branch(
      branchName: branchName ?? this.branchName,
      branchAddress: branchAddress ?? this.branchAddress,
      branchLatitude: branchLatitude ?? this.branchLatitude,
      branchLongitude: branchLongitude ?? this.branchLongitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchName': branchName,
      'branchAddress': branchAddress,
      'branchLatitude': branchLatitude,
      'branchLongitude': branchLongitude,
    };
  }

  factory branch.fromMap(Map<String, dynamic> map) {
    return branch(
      branchName: map['branchName'] as String,
      branchAddress: map['branchAddress'] as String,
      branchLatitude: map['branchLatitude'] as double,
      branchLongitude: map['branchLongitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory branch.fromJson(String source) => branch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'branch(branchName: $branchName, branchAddress: $branchAddress, branchLatitude: $branchLatitude, branchLongitude: $branchLongitude)';
  }

  @override
  bool operator ==(covariant branch other) {
    if (identical(this, other)) return true;

    return other.branchName == branchName &&
        other.branchAddress == branchAddress &&
        other.branchLatitude == branchLatitude &&
        other.branchLongitude == branchLongitude;
  }

  @override
  int get hashCode {
    return branchName.hashCode ^ branchAddress.hashCode ^ branchLatitude.hashCode ^ branchLongitude.hashCode;
  }
}

branch leductho = new branch(
  branchName: "Lê Đức Thọ",
  branchAddress: "433 Lê Đức Thọ, Phường 17, Quận Gò Vấp, TP.HCM",
  branchLatitude: 10.84261532491106,
  branchLongitude: 106.67282639729899,
);

branch phamvandong = new branch(
  branchName: "Phạm Văn Đồng",
  branchAddress: "962-964 Phạm Văn Đồng, phường Hiệp Bình Chánh, thành phố Thủ Đức, Thành Phố Hồ Chí Minh",
  branchLatitude: 10.835824243542415,
  branchLongitude: 106.73103966846341,
);

branch dinhbolinh = new branch(
  branchName: "Đinh Bộ Lĩnh",
  branchAddress: "170 Đinh Bộ Lĩnh, Phường 26, Quận Bình Thạnh. TP.HCM",
  branchLatitude: 10.810908499116424,
  branchLongitude: 106.70931145496975,
);

branch hoangvanthai = new branch(
  branchName: "Đinh Bộ Lĩnh",
  branchAddress: "77 Hoàng Văn Thái, Phường Tân Phú, Quận 7, Tp. Hồ Chí Minh",
  branchLatitude: 10.730282599664402,
  branchLongitude: 106.72217708195633,
);

branch dragonhill = new branch(
  branchName: "Dragon Hill 1",
  branchAddress: "15A Nguyễn Hữu Thọ, Phường Phước Kiểng, Nhà Bè, TP.HCM",
  branchLatitude: 10.709714791044238,
  branchLongitude: 106.70979279125102,
);

branch toky = new branch(
  branchName: "Tô Ký",
  branchAddress: "Tầng 1, tòa nhà Đông Hải, số 04 Tô Ký, Phường Tân Chánh Hiệp, Quận 12, Tp. Hồ Chí Minh",
  branchLatitude: 10.854316151491375,
  branchLongitude: 106.62550721264103,
);

branch notranglong = new branch(
  branchName: "Nơ Trang Long",
  branchAddress: "25 Nơ Trang Long, Phường 7, Quận Bình Thạnh, Tp. Hồ Chí Minh",
  branchLatitude: 10.807047940525253,
  branchLongitude: 106.69483018380527,
);

branch phamdinhho = new branch(
  branchName: "Phạm Đình Hổ",
  branchAddress: "92 Phạm Đình Hổ, Phường 2, Quận 6, Tp. Hồ Chí Minh",
  branchLatitude: 10.750909964865674,
  branchLongitude: 106.64963253962749,
);

branch nguyenthidinh = new branch(
  branchName: "Nguyễn Thị Định",
  branchAddress: "205 Nguyễn Thị Định, phường An Phú, Quận 2, Thành phố Hồ Chí Minh",
  branchLatitude: 10.789902475448839,
  branchLongitude: 106.75451463962769,
);

branch lychinhthang = new branch(
  branchName: "Lý Chính Thắng",
  branchAddress: "45 Lý Chính Thắng , Phường 8, Quận 3 , Tp. Hồ Chí Minh",
  branchLatitude: 10.790408696809418,
  branchLongitude: 106.68649798195665,
);

branch hoahong = new branch(
  branchName: "Hoa Hồng",
  branchAddress: "46 Hoa Hồng, Phường 7, quận Phú Nhuận, Tp.HCM",
  branchLatitude: 10.796653462898309,
  branchLongitude: 106.69036073543434,
);

branch cienco4 = new branch(
  branchName: "Tòa nhà Cienco 4",
  branchAddress: "180 Nguyễn Thị Minh Khai, Phường 6, Quận 3, Tp. Hồ Chí Minh",
  branchLatitude: 10.776584205536828,
  branchLongitude: 106.69163415496965,
);

branch levansy = new branch(
  branchName: "Lê Văn Sỹ",
  branchAddress: "188A Lê Văn Sỹ, phường 10, quận Phú Nhuận, Thành phố Hồ Chí Minh",
  branchLatitude: 10.793528068074108,
  branchLongitude: 106.66986459729864,
);
List<branch> listBranches = [
  leductho,
  cienco4,
  dinhbolinh,
  dragonhill,
  hoangvanthai,
  hoahong,
  phamvandong,
  phamdinhho,
  toky,
  notranglong,
  nguyenthidinh,
  lychinhthang,
  levansy,
];
