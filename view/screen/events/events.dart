/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_project/controller/events/events_controller.dart';
import 'package:event_project/controller/favorite_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:event_project/linkapi.dart';
import 'package:event_project/view/widget/events/customappbarevents.dart';
import 'package:event_project/view/widget/events/customlistevents.dart';
import 'package:event_project/view/widget/events/listcategoriesevents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    EventsControllerImp controller = Get.put(EventsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.bkcolor,
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomAppBarEvents(
                titleappbar: 'Search',
                onPressedSearch: () {
                  controller.onSearchEvents();
                },
                // onPressedIconFav: () {
                //   Get.toNamed(AppRoute.myfavorite);
                // },
                active: controllerFav.currentpage == 0 ? true : false,
                mycontroller: controller.search!,
                onChanged: (val) {
                  controller.checkSearch(val);
                }, 
              ),
                const SizedBox(height: 10),
                const ListCategoriesEvents(),
                GetBuilder<EventsControllerImp>(
                    builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                      ? GridView.builder(
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, childAspectRatio: 1.2),
                            itemBuilder: (BuildContext context, index) {
                              controllerFav.isFavorite[controller.data[index]
                                      ['event_id']] =
                                  controller.data[index]['favorite'];
                              return CustomListEvents(
                                eventsModel: EventsModel.fromJson(
                                    controller.data[index]),
                              );
                            }): ListEventsSearch(listdatamodel: controller.listdata)
                            )
                            )
              ],
            )),
      ),
    );
  }
}

class ListEventsSearch extends GetView<EventsControllerImp> {
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
              color: Appcolor.bkcolor,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    color: Appcolor.searchcolor,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageEvents}/${listdatamodel[index].eventImage}" , fit: BoxFit.cover,) ),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(
                                listdatamodel[index].eventName!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle:
                                  Text(listdatamodel[index].categoriesName!),
                            )),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}
