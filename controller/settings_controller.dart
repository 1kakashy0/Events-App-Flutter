/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/users_data.dart';
import 'package:event_project/data/model/usersmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
   UsersData usersData = UsersData(Get.find());
  MyServices myServices = Get.find();
  var isNotificationEnabled = true;
  List<UsersModel> data = [] ;

  late UsersModel usersModel ;

  late StatusRequest statusRequest;


  getUsers() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData
        .getData(myServices.sharedpreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  void refreshData() {
    getUsers(); // Re-fetch the data
  }

  // logout() {
  //   String userid = myServices.sharedpreferences.getString("id").toString();
  //   FirebaseMessaging.instance.unsubscribeFromTopic("users");
  //   FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
  //   myServices.sharedpreferences.clear();
  //   Get.offAllNamed(AppRoute.language);
  // }

  toggleNotification(bool val) async {
    String userid = myServices.sharedpreferences.getString("id").toString();
    if (val) {
      await FirebaseMessaging.instance.subscribeToTopic("users${userid}");
      isNotificationEnabled = true;
      Get.snackbar("Notification", "Enabled");
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
      isNotificationEnabled = false;
      Get.snackbar("Notification", "Disabled");
    }
        update(); // Update the UI
  }

  goToUsersView(UsersModel usersModel){
  Get.toNamed(AppRoute.usersView, arguments: {'usersModel': usersModel});
 }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
