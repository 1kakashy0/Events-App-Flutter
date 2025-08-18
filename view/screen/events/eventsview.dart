/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/events/eventview_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/view/widget/events/eventsusersview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersEventView extends StatelessWidget {
  const UsersEventView({super.key});
  @override
  Widget build(BuildContext context) {
    EventUsersViewController Controller = Get.put(EventUsersViewController());
    return Scaffold(
        backgroundColor: Appcolor.bkcolor,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Get.toNamed(AppRoute.addevents);
          },
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.add)),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Appcolor.bkcolor,
          elevation: 5,
          leading: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              'My Events',
              style: TextStyle(
                  fontSize: 25,
                  color: Appcolor.pink,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<EventUsersViewController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              Controller.data.length,
                              (index) => InkWell(
                                onTap: (){
                                  // controller.goToPageProductDetails(controller.data[index]);
                                },
                                child: CustomEventsUsersList(
                                  // onAdd: () async {
                                  //   await Controller
                                  //       .add(Controller.data[index].eventId.toString());
                                  //   Controller.refreshPage();
                                  // },
                                  // onRemove: () async {
                                  //   await Controller.deleteEvents(Controller
                                  //       .data[index].eventId.toString());
                                  //   Controller.refreshPage();
                                  // },
                                  location: "${Controller.data[index].eventLocation}",
                                  imageName:
                                      "${Controller.data[index].eventImage}",
                                  name: "${Controller.data[index].eventName}",
                                  price: "${Controller.data[index].eventPrice}",
                                  status: "${Controller.data[index].eventStatus}",
                                  onRemove: () async {
                                    await Controller.deleteEvents(
                                        Controller.data[index].eventId.toString(),
                                        controller.data[index].eventTableid
                                            .toString());
                                    Controller.refreshPage();
                                  },
                                  onEdit: () {
                                    controller.goToEventsEdit(Controller.data[index]);
                                  },
                                  // count:
                                  // "${cartController.data[index].countevents}"
                                ),
                              ),
                            )
                          ],
                          ),
                      )
                    ],  
                  )))),
        ));
  }
}
