/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title ;
  final String body ;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
                              child: Stack(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Appcolor.pink,
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text(title,
                                    style:const TextStyle(fontSize: 20)),
                                subtitle: Text(body,
                                    style:const TextStyle(fontSize: 14)),
                              ),
                            ),
                            Positioned(
                                top: -30,
                                right: controller.lang == "en" ? -30 : null,
                                left : controller.lang == "ar" ? -30 : null,
                                child: Container(
                                  height: 160,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Appcolor.circle,
                                      borderRadius: BorderRadius.circular(160)),
                                ))
                          ]));
  }
}