/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/productdetails_controller.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAbout extends GetView<ProductDetailsControllerImp> {
  const ProductAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("About",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${translateDataBase(controller.eventsModel.eventDescAr, controller.eventsModel.eventDesc, controller.eventsModel.eventDescFr)}",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
  }
}