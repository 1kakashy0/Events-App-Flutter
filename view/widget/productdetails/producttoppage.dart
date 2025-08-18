/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/controller/favorite_controller.dart';
import 'package:event_project/controller/productdetails_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTopPage extends GetView<ProductDetailsControllerImp> {
  final EventsModel? eventsModel;
  const ProductTopPage({super.key, required this.eventsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Hero(
          tag: "${controller.eventsModel.eventId}",
          child: CachedNetworkImage(
            imageUrl:
                "${AppLink.imageEvents}/${controller.eventsModel.eventImage!}",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: GetBuilder<FavoriteController>(
            builder: (controller) => IconButton(
                onPressed: () {
                  if (controller.isFavorite[eventsModel!.eventId].toString() ==
                      "1") {
                    controller.setFavorite(eventsModel!.eventId, "0");
                    controller.removeFavorite(eventsModel!.eventId.toString());
                  } else {
                    controller.setFavorite(eventsModel!.eventId, "1");
                    controller.addFavorite(eventsModel!.eventId.toString());
                  }
                },
                icon: Icon(
                    controller.isFavorite[eventsModel?.eventId].toString() ==
                            "1"
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Appcolor.pink)),
          ),
        ),
        Positioned(
          bottom: -90,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${translateDataBase(controller.eventsModel.eventNameAr, controller.eventsModel.eventName, controller.eventsModel.eventNameFr)}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${controller.eventsModel.eventLocation}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${controller.eventsModel.eventDate}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    controller.eventsModel.eventDiscount.toString() != "0"
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${controller.eventsModel.eventPrice.toString()} TND",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${controller.eventsModel.eventDiscount}% OFF",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Appcolor.pink,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: Appcolor.pink,
                                child: Text(
                                  "${controller.eventsModel.eventsPriceDiscount.toString()} TND",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            color: Appcolor.pink,
                            child: Text(
                              "${controller.eventsModel.eventsPriceDiscount.toString()} TND",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
