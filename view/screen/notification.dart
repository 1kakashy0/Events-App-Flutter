/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/controller/notification_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/alertexitapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return PopScope(
              canPop: false,
              onPopInvoked: alertExitApp,
              child: Scaffold(
      backgroundColor: Appcolor.bkcolor,
      body: Container(
        child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(children: [
                      const Center(
                          child: Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 18,
                            color: Appcolor.pink,
                            fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(height: 10),
                      ...List.generate(
                          controller.data.length,
                          (index) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Stack(
                                  children: [
                                    ListTile(
                                      title: Text(controller.data[index]
                                          ['notification_title'] , style: const TextStyle(color: Colors.white),),
                                      subtitle: Text(controller.data[index]
                                          ['notification_body'] , style: const TextStyle(color: Colors.white),),
                                    ),
                                    Positioned(
                                        right: 5,
                                        child: Text(
                                          Jiffy.parse(controller.data[index]['notification_datetime'].toString()).fromNow(),
                                          style:const TextStyle(
                                              color: Appcolor.pink,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ))
                    ])))),
      ),
    ));
  }
}