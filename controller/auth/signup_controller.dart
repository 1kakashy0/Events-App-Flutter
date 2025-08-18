/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;

  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postdata(
          username.text, email.text, password.text, phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.susccess) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifycodesignup,
              arguments: {"email": email.text});
          Get.defaultDialog(
              backgroundColor: Appcolor.bkcolor,
              titleStyle: const TextStyle(color: Colors.white),
              middleTextStyle: const TextStyle(color: Colors.white),
              title: "38".tr,
              middleText: "39".tr);
        } else {
          Get.defaultDialog(
              backgroundColor: Appcolor.bkcolor,
              titleStyle: const TextStyle(color: Colors.white),
              middleTextStyle: const TextStyle(color: Colors.white),
              title: "40".tr,
              middleText: "41".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
