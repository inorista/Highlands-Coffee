import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';
import 'package:seemon/controllers/home_controllers.dart';
import 'package:seemon/views/map/components/branch_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with AutomaticKeepAliveClientMixin<MapScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  late BitmapDescriptor pinLocationIcon;
  bool _keepAlive = true;
  List<Marker> allMarker = [];
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon =
        await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2), "assets/images/marker.png")
            .then((value) => pinLocationIcon = value);
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> mapController = Get.find<HomeController>().mapController;
    HomeController _controller = Get.put(HomeController());
    Future<void> _onMapCreated(GoogleMapController controller) async {
      allMarker = _controller.listBranch
          .map(
            (e) => Marker(
              icon: BitmapDescriptor.defaultMarker,
              markerId: MarkerId(e.branchName),
              position: LatLng(e.branchLatitude, e.branchLongitude),
            ),
          )
          .toList();

      mapController.complete(controller);
    }

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: 0,
            child: GoogleMap(
              markers: allMarker.toSet(),
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(_controller.currentBranch!.branchLatitude, _controller.currentBranch!.branchLongitude),
                zoom: 14,
              ),
              onMapCreated: _onMapCreated,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .85,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xfffefefe),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(-0.1, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  "assets/images/navigator.png",
                                  height: 6,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kPaddingDefault * 2,
                                ),
                                child: Text(
                                  "Bao gồm ${_controller.listBranch.length} quán",
                                  style: kStyleListBranch,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Scrollbar(
                            child: ListView.builder(
                              controller: scrollController,
                              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              addAutomaticKeepAlives: true,
                              addSemanticIndexes: true,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: _controller.listBranch.length,
                              itemBuilder: (context, index) => branch_widget(
                                crBranch: _controller.listBranch[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 12,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                EvaIcons.arrowIosBack,
                size: 30,
                color: Color(0xff666666),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => _keepAlive;
}
