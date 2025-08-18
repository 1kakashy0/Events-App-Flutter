/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'dart:async';

// import 'package:event_project/core/class/statusrequest.dart';
// import 'package:event_project/core/constant/routesnames.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class AddAddressController extends GetxController {
//   StatusRequest statusRequest = StatusRequest.loading;

//   Completer<GoogleMapController>? completercontroller;

//   List<Marker> markers = [];

//   double? lat;
//   double? long;

//   addMarkers(LatLng latLng) {
//     markers.clear();
//     markers.add(Marker(markerId: MarkerId("1"), position: latLng));
//     lat = latLng.latitude;
//     long = latLng.longitude;
//     update();
//   }

//   goToPageAddDetailsAddress() {
//     Get.toNamed(AppRoute.addressadddetails,
//         arguments: {"lat": lat.toString(), "long": long.toString()});
//   }

//   Position? postion;

//   CameraPosition? kGooglePlex;

//   getCurrentLocation() async {
//     postion = await Geolocator.getCurrentPosition();
//     kGooglePlex = CameraPosition(
//       target: LatLng(postion!.latitude, postion!.longitude),
//       zoom: 14.4746,
//     );
//     statusRequest = StatusRequest.none;
//     update();
//   }

//   @override
//   void onInit() {
//     getCurrentLocation();
//     completercontroller = Completer<GoogleMapController>();
//     super.onInit();
//   }
// }



import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  MapController? mapController = MapController();

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(
      width: 80.0,
      height: 80.0,
      point: latLng,
        child: Icon(Icons.location_on, size: 50, color: Colors.red),
      ),
    );
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressadddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  Position? postion;

  LatLng? initialPosition;

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    initialPosition = LatLng(postion!.latitude, postion!.longitude);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}



