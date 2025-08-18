/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingConroller extends GetxController {
next() ;
onPageChanged(int index);
}

class OnBoardingConrollerImp extends OnBoardingConroller{

  late PageController pageController ;

  int currentPage = 0 ; // nabdew ml 0 = page loula

  @override
  void onInit() {
    pageController = PageController(); 
    super.onInit();
  }

  MyServices myservices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onboardingmodelListe.length-1){
      myservices.sharedpreferences.setString("step", "1"); // 3malna setstring fl anboartding controller w getstring fel mymiddleware.dart
      Get.offAllNamed(AppRoute.login);
    }else {
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut); // hedhy lel button besh yaaml next
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index; // idha l index eli ta3tih page view builder = current page +1
    update();

  }

}