/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class CustomSlider extends GetView<OnBoardingConrollerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller
            .pageController, //contrller onboarding controller besh tet7akm fl pageview.builder
        onPageChanged: (val) {
          controller.onPageChanged(val); // function fl onboarding controller
        },
        itemCount: onboardingmodelListe.length,
        itemBuilder: (context, i) => Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  // width: double.infinity,
                  // alignment: Alignment.center,
                  // padding: const EdgeInsets.all(8.0),
                  child: Image.asset(onboardingmodelListe[i].image!),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onboardingmodelListe[i].title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Poppines",
                        fontWeight: FontWeight.bold,
                        wordSpacing: 4,
                        height: 1.3,
                        letterSpacing: 1.2),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    (onboardingmodelListe[i].body!),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "Poppines",
                        wordSpacing: 1.5),
                  ),
                )
              ],
            ));
  }
}
