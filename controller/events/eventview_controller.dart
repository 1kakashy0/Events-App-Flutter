/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/events/eventview_data.dart';
import 'package:event_project/data/model/users_eventsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventUsersViewController extends GetxController {
  UsersEventsData usersEventsData = UsersEventsData(Get.find());

  List<UsersEventsModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

    String? eventsid   ;
    String? eventsid2   ;
    


  // String printOrderType(String val) {
  //   if (val == "0") {
  //     return "delivery";
  //   } else {
  //     return "Recive";
  //   }
  // }

  // String printPaymentMethod(String val) {
  //   if (val == "0") {
  //     return "Cash On Delivery";
  //   } else {
  //     return "Payment Card";
  //   }
  // }

  // String printOrderStatus(String val) {
  //   // if (val == "0") {
  //   //   return "Pending Approval";
  //   // } else if (val == "1") {
  //   //   return "The Order is being Prepared ";
  //   // } else if (val == "2") {
  //   //   return "Ready To Picked up by Delivery man";
  //   // }  else if (val == "3") {
  //   //   return "On The Way";
  //   // } else {
  //     return "Archive";
  //   // }
  // }

  goToPageProductDetails(UsersEventsModel usersEventsModel) {
    Get.toNamed("productdetails", arguments: {"userseventsmodel": usersEventsModel});
  }

  getEvents() async {
    data.clear();
    update();
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersEventsData
        .getData(myServices.sharedpreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => UsersEventsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  deleteEvents(String eventsid , String eventsid2) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersEventsData.deleteEvent(
        myServices.sharedpreferences.getString("id")!, eventsid.toString() , eventsid2.toString());
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


 goToEventsEdit(UsersEventsModel usersEventsModel){
  Get.toNamed(AppRoute.editevents, arguments: {'usersEventsModel': usersEventsModel});
 }

  refreshPage() {
    getEvents();
  }

  @override
  void onInit() {
    getEvents();
    super.onInit();
  }
}