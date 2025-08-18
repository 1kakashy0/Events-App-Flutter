/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/events/events_controller.dart';
import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/offers_data.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());
  List<EventsModel> data = [];
  // List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find() ;
  

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await offerData.getData();
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      if (response['status'] == "success"){
        List responsedata = response['data'] ;
        data.addAll(responsedata.map((e) => EventsModel.fromJson(e))) ;
      // listdata.addAll(response['data']);
    }else {
      statusRequest = StatusRequest.failure;
    }
    }
    update();
  }



  // getData() async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await offerData.getData();
  //   print("=============================== Controller $response ") ;
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.susccess == statusRequest) {
  //     if (response['status'] == "success"){
  //     data.addAll(response['data']);
  //   }else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   }
  //   update();
  // }

  refrechPage(){
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    getData();
  }

  goToPageProductDetails(EventsModel eventsmodel) {
    Get.toNamed("productdetails" , arguments: {
      "eventsmodel" : eventsmodel
    }) ;
  }

  @override
  void onInit() {
    getData();
    search = TextEditingController() ;
    super.onInit();
  }
}
