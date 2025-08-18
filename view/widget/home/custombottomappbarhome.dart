/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/controller/homescreen_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
                shadowColor: Appcolor.bkcolor,
                clipBehavior: Clip.none,
                elevation: 0,
                height: 60,
                color: Appcolor.bkcolor,
                child:
                Row(
                  children: [
                    ...List.generate(controller.listPage.length , ((int i) {
                      return CustomBottomAppBar(
                          icondata: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changepage(i);
                          },
                          active: controller.currentpage == i ? true : false);
                }))
                  ],
                )
                )
                ,);
  }
  
}