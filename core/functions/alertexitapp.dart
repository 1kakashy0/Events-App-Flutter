/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future alertExitApp(bool value) {
  return Get.defaultDialog(
      backgroundColor: Appcolor.bkcolor,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white) ,
      title: "Alert!",
      middleText: "Do you want to exit ?",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("confirm")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("cancel")),
      ]);

// return Future.value(true);
}
