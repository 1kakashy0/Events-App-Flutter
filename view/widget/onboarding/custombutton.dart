/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/onboarding_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnboarding extends GetView<OnBoardingConrollerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolor.pink,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 30),
      height: 50,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 4),
        textColor: Colors.white,
        onPressed: () {
          controller.next();    //function fy onboarding controller fy dossier controller rbatneha bl GetView<OnBoardingConrollerImp>
        },
        child: Text("8".tr),
      ),
    );
  }
}
