/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/functions/uploadfile.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/feedback_data.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/data/model/feedbackmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackController extends GetxController {
  String? eventid;
  late TextEditingController comment;
  late TextEditingController rating;
  late TextEditingController photoUrl;
  File? file;

  List<FeedBackModel> data = [];
  EventsModel? eventsModel ;

    StatusRequest statusRequest = StatusRequest.none;

    FeedBackData feedBackData = FeedBackData(Get.find());
      MyServices myServices = Get.find();

      void chooseImage() async {
    file = await fileUploadGallery();
    update();
  }


  addFeedback() async {
    statusRequest = StatusRequest.loading;
    update();

    Map<String, String> data = {
    "user_id": myServices.sharedpreferences.getString("id")!,
    "eventid": eventsModel!.eventId!.toString(),
    "comment": comment.text,
    "rating": rating.text,
    "photo_url": photoUrl.text,
  };

    var response = await feedBackData.postdata(data, file);

  if (response == null || response['status'] == 'error') {
    // Handle null or error response
    statusRequest = StatusRequest.failure;
    update();
    return;
  }

  if (response['status'] == "success") {
    // Get.toNamed(AppRoute.eventsView);
    FeedBackController c = Get.find();
    c.getEvents();
    statusRequest = StatusRequest.susccess;
  } else {
    statusRequest = StatusRequest.failure;
  }

  update();
}


getEvents() async {
    data.clear();
    update();
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await feedBackData
        .getData(eventsModel!.eventId!.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => FeedBackModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  notNull (field){
    if ( field == null ) {
      return false;
    }else if (field.toString() == "fail"){
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    eventsModel = Get.arguments['eventsModel'];
    comment = TextEditingController();
    rating = TextEditingController();
    photoUrl = TextEditingController();
    getEvents();
      super.onInit();
  }
}