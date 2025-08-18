/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:event_project/controller/favorite_controller.dart';
// import 'package:event_project/controller/home_controller.dart';
// import 'package:event_project/core/class/handlingdataview.dart';
// import 'package:event_project/core/constant/colors.dart';
// import 'package:event_project/core/constant/routesnames.dart';
// import 'package:event_project/core/functions/alertexitapp.dart';
// import 'package:event_project/data/model/eventsmodel.dart';
// import 'package:event_project/linkapi.dart';
// import 'package:event_project/view/widget/customappbar.dart';
// import 'package:event_project/view/widget/home/customcardhome.dart';
// import 'package:event_project/view/widget/home/customtitlehome.dart';
// import 'package:event_project/view/widget/home/listcategorieshome.dart';
// import 'package:event_project/view/widget/home/listeventshome.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     HomeControllerImp controller = Get.put(HomeControllerImp());
//     FavoriteController controllerFav = Get.put(FavoriteController());

//     return Scaffold(
//         backgroundColor: Appcolor.bkcolor,
//         body: SafeArea(
//           child: PopScope(
//               canPop: false,
//               onPopInvoked: alertExitApp,
//               child:GetBuilder<HomeControllerImp>(
//                 builder: (controller) {  
//                   return Container( 
//                   margin: const EdgeInsets.only(top: 10),
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   child: ListView(
//                     children: [
//                       CustomAppBar(
//                         titleappbar: 'Search',
//                         onPressedSearch: () {
//                           controller.onSearchEvents();
//                         },
//                         onPressedIconFav: () {
//                           Get.toNamed(AppRoute.myfavorite);
//                         },
//                         active: false,
//                         mycontroller: controller.search!,
//                         onChanged: (val) {
//                           controller.checkSearch(val);
//                         },
//                       ),
//                       GetBuilder<HomeControllerImp>(
//                           builder: (controller) => HandlingDataView(
//                               statusRequest: controller.statusRequest,
//                               widget: !controller.isSearch
//                                   ? Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         if (controller.texts.isNotEmpty)
//                                           CustomCardHome(
//                                             title:
//                                                 "${controller.texts[0]["texts_titleone"]}",
//                                             body:
//                                                 "${controller.texts[0]["texts_bodyhome"]}",
//                                           ),
//                                         SizedBox(height: 10),
//                                         ListCategoriesHome(),
//                                         SizedBox(height: 10),
//                                         CustomTitleHome(
//                                           title: 'Top Selling',
//                                         ),
//                                         SizedBox(height: 10),
//                                         SizedBox(
//                                           height: 140,
//                                           child: ListView.builder(
//                                               itemCount:
//                                                   controller.events.length,
//                                               scrollDirection: Axis.horizontal,
//                                               itemBuilder: (context, i) {
//                                                 controllerFav.isFavorite[
//                                                         controller.events[i]
//                                                             ['event_id']] =
//                                                     controller.events[i]  
//                                                         ['favorite'];
//                                                 return EventsHome(
//                                                     eventsModel:
//                                                         EventsModel.fromJson(
//                                                             controller
//                                                                 .events[i]));
//                                               }),
//                                         )
//                                         // EventsHome(eventsModel: controller.data[index],),
//                                         // CustomTitleHome(
//                                         //   title: 'Offer',
//                                         // ),
//                                         // SizedBox(height: 10),
//                                         // ListEventsHome(),
//                                         // CustomTitleHome(
//                                         //   title: 'Offer',
//                                         // ),
//                                         // SizedBox(height: 10),
//                                         // ListEventsHome(),
//                                         // CustomTitleHome(
//                                         //   title: 'Offer',
//                                         // ),
//                                         // SizedBox(height: 10),
//                                         // ListEventsHome(),
//                                       ],
//                                     )
//                                   : ListEventsSearch(
//                                       listdatamodel: controller.listdata)))
//                     ],
//                   ),
//                 );
//   })),
//         ));
//   }
// }

// class ListEventsSearch extends GetView<HomeControllerImp> {
//   final List<EventsModel> listdatamodel;
//   const ListEventsSearch({super.key, required this.listdatamodel});

//   @override
//   Widget build(BuildContext context) {
//     return  ListView.builder(
//         itemCount: listdatamodel.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               controller.goToPageProductDetails(listdatamodel[index]);
//             },
//             child: Container(
//               color: Appcolor.bkcolor,
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               child: Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Container(
//                     color: Appcolor.searchcolor,
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: CachedNetworkImage(
//                           imageUrl:
//                               "${AppLink.imageEvents}/${listdatamodel[index].eventImage}",
//                           fit: BoxFit.cover,
//                         )),
//                         Expanded(
//                             flex: 2,
//                             child: ListTile(
//                               title: Text(
//                                 listdatamodel[index].eventName!,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               subtitle:
//                                   Text(listdatamodel[index].categoriesName!),
//                             )),
//                       ],
//                     ),
//                   )),
//             ),
//           );
//         });
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/controller/favorite_controller.dart';
import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/alertexitapp.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:event_project/view/widget/customappbar.dart';
import 'package:event_project/view/widget/home/customcardhome.dart';
import 'package:event_project/view/widget/home/customtitlehome.dart';
import 'package:event_project/view/widget/home/listcategorieshome.dart';
import 'package:event_project/view/widget/home/listeventshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      body: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvoked: alertExitApp,
          child: GetBuilder<HomeControllerImp>(builder: (controller) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: ListView(
                children: [
                  // Custom AppBar with Search and Favorites
                  CustomAppBar(
                    titleappbar: 'Search',
                    onPressedSearch: () {
                      controller.onSearchEvents();
                    },
                    onPressedIconFav: () {
                      Get.toNamed(AppRoute.myfavorite);
                    },
                    active: false,
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<HomeControllerImp>(
                    builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Custom Card for Banner or Introduction
                                if (controller.texts.isNotEmpty)
                                  CustomCardHome(
                                    title: "${controller.texts[0]["texts_titleone"]}",
                                    body: "${controller.texts[0]["texts_bodyhome"]}",
                                  ),
                                const SizedBox(height: 20),
                                
                                // Categories Section with Horizontal Scroll
                                const CustomTitleHome(title: 'Categories'),
                                const SizedBox(height: 10),
                                ListCategoriesHome(),

                                const SizedBox(height: 20),

                                // Top Selling Section
                                const CustomTitleHome(title: 'Top Selling'),
                                const SizedBox(height: 10),

                                // Event Cards with Horizontal Scroll
                                SizedBox(
                                  height: 240, // Increased for better space
                                  child: ListView.builder(
                                    itemCount: controller.events.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      controllerFav.isFavorite[controller.events[i]['event_id']] =
                                          controller.events[i]['favorite'];
                                      return EventsHome(
                                          eventsModel: EventsModel.fromJson(controller.events[i]));
                                    },
                                  ),
                                ),
                              ],
                            )
                          : ListEventsSearch(listdatamodel: controller.listdata),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ListEventsSearch extends GetView<HomeControllerImp> {
  final List<EventsModel> listdatamodel;
  const ListEventsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                color: Appcolor.searchcolor,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    // Cached Image with Rounded Corners
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: "${AppLink.imageEvents}/${listdatamodel[index].eventImage}",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Event Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listdatamodel[index].eventName!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            listdatamodel[index].categoriesName!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
