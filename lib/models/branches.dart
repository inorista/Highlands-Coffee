import 'package:google_maps_flutter/google_maps_flutter.dart';

class branch {
  String branchName;
  String branchAddress;
  LatLng branchLatLng;

  branch({
    required this.branchName,
    required this.branchAddress,
    required this.branchLatLng,
  });
}
