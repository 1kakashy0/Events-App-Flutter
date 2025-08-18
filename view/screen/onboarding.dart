/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/onboarding_controller.dart';
import 'package:event_project/view/widget/onboarding/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingConrollerImp()); //injection lel onboarding controller imp  besh nouslouha ml widgets lkol
    return const Scaffold(
        backgroundColor: Appcolor.bkcolor,
        body: SafeArea(
            child: Column(children: [
          Expanded(
            flex: 4,
            child:CustomSlider() , //slider mtee tsawer mawjood fl widget/onboarding
          ),
          Expanded(
            flex: 1,
            child: Column(children: [
              Spacer(flex: 2,) ,
              DotController(), //dot mtee tsawer zeda mawjood fl widget/onboarding
              Spacer(flex: 2),
              CustomButtonOnboarding() //button next mawjood fl widget/onboarding
            ]),
          )
        ])));
  }
}


//asmaanii tnekt omha ki zedt l column ml fouk w l containers .. shoof maahom 