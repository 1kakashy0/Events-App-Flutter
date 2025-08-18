/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goTpForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find() ; 

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.susccess) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'].toString() == "1"){
            myServices.sharedpreferences.setString("id", response['data']['users_id'].toString() );
            String userid = myServices.sharedpreferences.getString("id").toString();
            myServices.sharedpreferences.setString("username", response['data']['users_name']);
            myServices.sharedpreferences.setString("email", response['data']['users_email']);
            myServices.sharedpreferences.setString("phone", response['data']['users_phone']);
            myServices.sharedpreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
            Get.offNamed(AppRoute.homepage);
          }else{
            Get.toNamed(AppRoute.verifycodesignup , arguments: {"email" : email.text} );
          }
        } else {
          Get.defaultDialog(
              backgroundColor: Appcolor.bkcolor,
              titleStyle: const TextStyle(color: Colors.white),
              middleTextStyle: const TextStyle(color: Colors.white),
              title: "40".tr,
              middleText: "44".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goTpForgetPassword() {
    Get.toNamed(AppRoute.forgetpassword);
  }
}
