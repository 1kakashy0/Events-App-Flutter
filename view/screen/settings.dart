/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/settings_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/constant/imageasset.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/alertexitapp.dart';
import 'package:event_project/data/model/usersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  UsersModel? usersModel;
    Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return PopScope(
              canPop: false,
              onPopInvoked: alertExitApp,
              child: Scaffold(
        backgroundColor: Appcolor.bkcolor,
        body: Container(
          child: GetBuilder<SettingsController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: Get.width / 3, color: Appcolor.pink),
                    Positioned(
                        top: Get.width / 3.9,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Appcolor.bkcolor,
                                backgroundImage:
                                    const AssetImage(Imageasset.avatar1),
                              ),
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) =>
                  Text("${controller.data[index].usersName}" , style: const TextStyle(color: Colors.white),)),
                          ],
                        )),
                      // Positioned(
                      //   top: Get.width / 3.9,
                      //   child: Container(
                      //   decoration: BoxDecoration(
                      //     color: Colors.green,
                      //     borderRadius: BorderRadius.circular(40),
                      //   ),
                      // ))
                  ]),
                  
              const SizedBox(height: 100),
              Container(
                
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Appcolor.searchcolor,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    GetBuilder<SettingsController>(
                        builder: (_) {
                          return ListTile(
                            trailing: Switch(
                              onChanged: controller.toggleNotification,
                              value: controller.isNotificationEnabled,
                            ),
                            title: Text(
                              "Disable Notifications",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                      ...List.generate(
                              controller.data.length,
                              (index) => ListTile(
                      onTap: () {
                        controller.goToUsersView(controller.data[index]) ;
                      },
                      trailing: Icon(Icons.face),
                      title: Text("Profile" , style: TextStyle(color: Colors.white))),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.ordersArchive) ;
                      },
                      trailing: Icon(Icons.airplane_ticket_outlined),
                      title: Text("My Tickets" , style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.addressview) ;
                      },
                      trailing: Icon(Icons.location_on_outlined),
                      title: Text("Address" , style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.eventsView) ;
                      },
                      trailing: const Icon(Icons.event),
                      title: const Text("Add Your Own Event" , style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      onTap: () {
                        launchUrl(Uri.parse("tel:+21653135547"));
                      },
                      trailing: Icon(Icons.phone_callback_outlined),
                      title: Text("Contact us" , style: TextStyle(color: Colors.white)),
                    ),
                    // ListTile(
                    //   onTap: () {
                    //     controller.logout();
                    //   },
                    //   title: Text("Logout" , style: TextStyle(color: Colors.white)),
                    //   trailing: Icon(Icons.exit_to_app),
                    // ),
                    // Center(
                    //           child: MaterialButton(onPressed: () async {
                    //             AccessTokenfirebase accessTokenGetter = AccessTokenfirebase();
                    //             String token = await accessTokenGetter.getAccessToken();
                    //             print(token);
                    //           }, ),
                    //         )
                  ]),
                ),
              )
            ],
          ),
        ))))));
  }
}
