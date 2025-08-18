/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/controller/events/events_controller.dart';
import 'package:event_project/controller/favorite_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/imageasset.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListEvents extends GetView<EventsControllerImp> {
  final EventsModel eventsModel;
  const CustomListEvents(
      {super.key, required this.eventsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(eventsModel);
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<FavoriteController>(builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[eventsModel.eventId].toString() == "1"){
                                  controller.setFavorite(eventsModel.eventId, "0");
                                  controller.removeFavorite(eventsModel.eventId.toString());
                                }else {
                                  controller.setFavorite(eventsModel.eventId, "1");
                                  controller.addFavorite(eventsModel.eventId.toString());
                                }
                              },
                              icon: Icon(
                                  controller.isFavorite[eventsModel.eventId].toString() == "1"
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Appcolor.pink)),),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolor.pink),
                            onPressed: () {
                              controller.goToPageProductDetails(eventsModel);
                            },
                            child: const Text(
                              'Join',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              if (eventsModel.eventDiscount.toString() != "0") Positioned(
                top: 4,
                left: 4,
                child: Image.asset(Imageasset.sale , width: 50))
            ],
          ),
        ));
  }
}
