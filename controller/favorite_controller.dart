/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  int currentpage = 0;
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String? eventsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.susccess && response['status'] == "success") {
      setFavorite(eventsid!, 1);  // Update favorite status
      Get.rawSnackbar(
        title: "Notification",
        messageText: const Text("Event added to favorites"),
      );
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  removeFavorite(String? eventsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.susccess && response['status'] == "success") {
      setFavorite(eventsid!, 0);  // Update favorite status
      Get.rawSnackbar(
        title: "Notification",
        messageText: const Text("Event removed from favorites"),
      );
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  // Load favorite status on init


  // Load favorites from the database or API
  
}