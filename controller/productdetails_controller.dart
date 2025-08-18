/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/cart_data.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/data/model/users_eventsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

abstract class ProductDetailsController extends GetxController{


}

class ProductDetailsControllerImp extends ProductDetailsController {

// CartController cartController = Get.put(CartController()) ;

late EventsModel eventsModel ;
late UsersEventsModel usersEventsModel;

late StatusRequest statusRequest;

 List<Marker> markers = [];

    MapController? mapController = MapController();

  // double? lat;
  // double? long;

  LatLng? initialPosition;

  // addMarkers(LatLng latLng) {
  //   markers.clear();
  //   markers.add(Marker(
  //     width: 80.0,
  //     height: 80.0,
  //     point: latLng,
  //       child: Icon(Icons.location_on, size: 50, color: Colors.red),
  //     ),
  //   );
  //   lat = latLng.latitude;
  //   long = latLng.longitude;
  //   update();
  // }

  // getCurrentLocation() async {
  //   // postion = await Geolocator.getCurrentPosition();
  //   initialPosition = LatLng(double.parse(eventsModel.addressLat!.toString()),
  //             double.parse(eventsModel.addressLong!.toString()));
  //   markers.add(Marker(
  //     width: 80.0,
  //     height: 80.0,
  //     point: LatLng((eventsModel.addressLat!),
  //             (eventsModel.addressLong!)),
  //       child: Icon(Icons.location_on, size: 50, color: Colors.red),
  //     ),
  //   );
  //   statusRequest = StatusRequest.none;
  //   update();
  // }


CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  String? countevents = "0" ;

intialData() async{
  statusRequest = StatusRequest.loading ;
  eventsModel = Get.arguments['eventsmodel'];
  countevents = await getCountevents(eventsModel.eventId.toString()) ;
  statusRequest = StatusRequest.susccess ;
  double? lat = eventsModel.addressLat;
    double? long = eventsModel.addressLong;
    
    // Set the initial position using the fetched latitude and longitude
    if (lat != null && long != null) {
      initialPosition = LatLng(lat, long);
      markers.add(Marker(
      width: 80.0,
      height: 80.0,
      point: initialPosition!,
        child: Icon(Icons.location_on, size: 50, color: Colors.red),
      ),
    );  // Add the marker to the map
    }

    statusRequest = StatusRequest.susccess;
    update();
}



  addEvents(String eventsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("Event has been added to the cart"));
        // data.addAll(response['data']);
      } else {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("you have already add this Event to card"));
        // statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteEvents(String eventsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

    getCountevents(String eventsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // int countevents = 0;
        countevents = (response['data'].toString());
        print("==================================");
        print("$countevents");
        return countevents;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

goToFeedBack(EventsModel eventsModel){
  Get.toNamed(AppRoute.addFeedback, arguments: {'eventsModel': eventsModel});
 }



  @override
  void onInit() {
    intialData() ;
    super.onInit();
  }
}