/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/controller/notification_controller.dart';
import 'package:event_project/controller/offers_controller.dart';
import 'package:event_project/controller/settings_controller.dart';
import 'package:event_project/view/screen/home.dart';
import 'package:event_project/view/screen/notification.dart';
import 'package:event_project/view/screen/offers.dart';
import 'package:event_project/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  void changepage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {

  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    Settings(),
    const OffersView(),
  ];

  List bottomappbar = [
    { "icon": Icons.home},
    { "icon": Icons.notifications_active_outlined},
    { "icon": Icons.settings},
    { "icon": Icons.local_offer_outlined},
  ];

  

  @override
  void changepage(int i) {
    currentpage = i;

    switch (i) {
      case 0:
        // Accessing the HomeController
        Get.find<HomeControllerImp>().onInit();
        break;
      case 1:
        // Accessing the NotificationController
        Get.find<NotificationController>().getData();
        break;
      case 2:
        // Accessing the SettingsController
        Get.find<SettingsController>().getUsers();
        break;
      case 3:
        // Accessing the OffersController
        Get.find<OffersController>().getData();
        break;
    }

    update();
  }

@override
  void onInit() {
    super.onInit();
    Get.put(HomeControllerImp());
    Get.put(NotificationController());
    Get.put(SettingsController());
    Get.put(OffersController());
  }
}
