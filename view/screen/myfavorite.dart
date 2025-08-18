/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/controller/myfavorite_controller.dart';
import 'package:event_project/controller/offers_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/myfavorite/customlistfavoriteevents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    HomeControllerImp homecontroller = Get.put(HomeControllerImp());
    OffersController offerscontroller = Get.put(OffersController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.bkcolor,
        body: WillPopScope(
          onWillPop: () async {
            homecontroller.refreshData();
            // offerscontroller.refrechPage();
            Get.back(); // Refresh data when returning to the page
            return true; // Allow the pop action
          },
          child: Container(
            
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: GetBuilder<MyFavoriteController>(
              builder: (controller) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return CustomListFavoriteEvents(favoriteModel: controller.data[index]);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}