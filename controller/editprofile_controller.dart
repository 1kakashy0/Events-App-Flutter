/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/users_data.dart';
import 'package:event_project/data/model/usersmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersViewController extends GetxController {
  late TextEditingController usersname;
  late TextEditingController usersphone;
  late TextEditingController usersemail;

  UsersModel? usersModel ;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UsersData usersData = UsersData(Get.find());
GlobalKey<FormState> formstate = GlobalKey<FormState>();

bool validateInputs() {
    if (usersname.text.isEmpty) {
      Get.snackbar("Error", "username is empty");
      return false;
    }
    if (usersphone.text.isEmpty) {
      Get.snackbar("Error", "phone number is empty");
      return false;
    }
    if (usersemail.text.isEmpty) {
      Get.snackbar("Error", "email is empty");
      return false;
    }
    return true;
  }
  


  editUser() async {
    if (!validateInputs()) {
      return;
    }
  statusRequest = StatusRequest.loading;
  update();

  Map<String, String> data = {
    "users_id": myServices.sharedpreferences.getString("id")!,
    "users_name": usersname.text,
    "users_phone": usersphone.text,
    "users_email": usersemail.text,
  };

  var response = await usersData.editdata(data);

  if (response == null || response['status'] == 'error') {
    // Handle null or error response
    statusRequest = StatusRequest.failure;  
    update();
    return;
  }

  if (response['status'] == "success") {
    // Get.back();
    Get.offAllNamed(AppRoute.homepage);
    // EventUsersViewController c = Get.find();
    // c.getEvents();
    statusRequest = StatusRequest.susccess;
  } else {
    statusRequest = StatusRequest.failure;
  }

  update();
}
  

  logout() {
    String userid = myServices.sharedpreferences.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedpreferences.clear();
    Get.offAllNamed(AppRoute.language);
  }

  @override
  void onInit() {
    usersModel = Get.arguments['usersModel'];
    usersname = TextEditingController();
    usersphone = TextEditingController();
    usersemail = TextEditingController();
    usersname.text = usersModel!.usersName!;
    usersphone.text = usersModel!.usersPhone!;
    usersemail.text = usersModel!.usersEmail!;
      super.onInit();
  }
}