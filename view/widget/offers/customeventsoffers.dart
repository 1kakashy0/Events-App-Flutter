/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/controller/offers_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/imageasset.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListEventsOffers extends StatelessWidget {
  final EventsModel eventsModel;
  const CustomListEventsOffers({super.key, required this.eventsModel});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());

    return Stack(
      children: [
        InkWell(
          onTap: () {
            controller.goToPageProductDetails(eventsModel);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Appcolor.bkcolor,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "${eventsModel.eventId}",
                          child: CachedNetworkImage(
                            imageUrl: AppLink.imageEvents + eventsModel.eventImage!,
                            fit: BoxFit.fill,
                            height: 150,
                            width: 300,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${translateDataBase(eventsModel.eventNameAr, eventsModel.eventName, eventsModel.eventNameFr)}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${eventsModel.eventLocation}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Add more widgets here...
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (eventsModel.eventDiscount.toString() != "0")
          Positioned(
            top: 4,
            left: 4,
            child: Image.asset(Imageasset.sale, width: 50),
          ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}