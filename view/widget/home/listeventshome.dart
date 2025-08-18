/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:event_project/controller/favorite_controller.dart';
// import 'package:event_project/controller/home_controller.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:event_project/core/functions/translatedatabase.dart';
// import 'package:event_project/data/model/eventsmodel.dart';
// import 'package:event_project/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ListEventsHome extends GetView<HomeControllerImp> {
//   const ListEventsHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 140,
//       child: ListView.builder(
//           itemCount: controller.events.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, i) {
//             return EventsHome(
//                 eventsModel: EventsModel.fromJson(controller.events[i]));
//           }),
//     );
//   }
// }

// class EventsHome extends GetView<HomeControllerImp> {
//   final EventsModel eventsModel;
//   const EventsHome({super.key, required this.eventsModel});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         controller.goToPageProductDetails(eventsModel);
//         },
//       child: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             child: Image.network(
//               "${AppLink.imageEvents}/${eventsModel.eventImage}",
//               height: 180,
//               width: 200,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Positioned(
//               left: 20,
//               top: -5,
//               child: Text(
//                 // eventsModel.categoriesName.toString(),
                
//                 "${translateDataBase(eventsModel.eventNameAr, eventsModel.eventName, eventsModel.eventNameFr)}",
//                 style: const TextStyle(
//                     color: Colors.white,
//                     // fontWeight: FontWeight.bold,
//                     fontSize: 14),
//               )),
//           Positioned(
//             right: 20,
//               top: -15,
//             child: GetBuilder<FavoriteController>(builder: (controller) => IconButton(
//                               onPressed: () {
//                                 if (controller.isFavorite[eventsModel.eventId].toString() == "1"){
//                                   controller.setFavorite(eventsModel.eventId, "0");
//                                   controller.removeFavorite(eventsModel.eventId.toString());
//                                 }else {
//                                   controller.setFavorite(eventsModel.eventId, "1");
//                                   controller.addFavorite(eventsModel.eventId.toString());
//                                 }
//                               },
//                               icon: Icon(
//                                   controller.isFavorite[eventsModel.eventId].toString() == "1"
//                                       ? Icons.favorite
//                                       : Icons.favorite_border_outlined,
//                                   color: Appcolor.pink)),),),
//         ],
//       ),
//     );
//   }
// }

import 'package:event_project/controller/favorite_controller.dart';
import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/translatedatabase.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListEventsHome extends GetView<HomeControllerImp> {
  const ListEventsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Increased height for better layout
      child: ListView.builder(
        itemCount: controller.events.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return EventsHome(
            eventsModel: EventsModel.fromJson(controller.events[i]),
          );
        },
      ),
    );
  }
}

class EventsHome extends GetView<HomeControllerImp> {
  final EventsModel eventsModel;
  const EventsHome({super.key, required this.eventsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(eventsModel);
      },
      child: Stack(
        children: [
          // Event Card Container with rounded corners and elevation
          Container(
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  // Event Image with BoxFit.cover for proper scaling
                  Image.network(
                    "${AppLink.imageEvents}/${eventsModel.eventImage}",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Gradient Overlay to make text more readable on images
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Event Title Positioned
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Text(
                      translateDataBase(eventsModel.eventNameAr, eventsModel.eventName, eventsModel.eventNameFr),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.black54,
                          )
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Favorite Icon Positioned at the top-right
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GetBuilder<FavoriteController>(
                      builder: (controller) => IconButton(
                        onPressed: () {
                          if (controller.isFavorite[eventsModel.eventId].toString() == "1") {
                            controller.setFavorite(eventsModel.eventId, "0");
                            controller.removeFavorite(eventsModel.eventId.toString());
                          } else {
                            controller.setFavorite(eventsModel.eventId, "1");
                            controller.addFavorite(eventsModel.eventId.toString());
                          }
                        },
                        icon: Icon(
                          controller.isFavorite[eventsModel.eventId].toString() == "1"
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Appcolor.pink,
                          size: 28, // Increased icon size for better visibility
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
