/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/controller/editprofile_controller.dart';
import 'package:event_project/controller/settings_controller.dart';
import 'package:event_project/core/class/handlingdataview.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:event_project/core/functions/validinput.dart';
import 'package:event_project/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewController controller = Get.put(UsersViewController());
    SettingsController Setcontroller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
        appBar: AppBar(
      backgroundColor: Appcolor.bkcolor,
      elevation: 5,
      leading:
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back() ;
                          }, icon: const Icon(Icons.arrow_back , color: Colors.white,)),
                    )),
                    title:  Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Edit Profile',
                        style: const TextStyle(fontSize: 25 , color: Colors.white , fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
                )  ,
        body: GetBuilder<UsersViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                //   Container(
                // alignment: Alignment.center,
                // child: Image.asset(Imageasset.logo , height: 200,)), // Replace with your actual image
                // Container(
                //                 padding: EdgeInsets.all(4),
                //                 decoration: BoxDecoration(
                //                     color: Colors.white,
                //                     borderRadius: BorderRadius.circular(100)),
                //                 child: CircleAvatar(
                //                   radius: 40,
                //                   backgroundColor: Appcolor.bkcolor,
                //                   backgroundImage:
                //                       const AssetImage(Imageasset.avatar1),
                //                 ),
                //               ),
              const SizedBox(height: 20),
                  Card(
                  color: Appcolor.searchcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormAuth(
                        valid: (val) {
                          return (validInput(val!, 5, 100, 'username'));
                        },
                        isNumber: false,
                        mycontroller: controller.usersname,
                        hinttext: "21".tr,
                        labeltext: "22".tr,
                        icondata: Icons.person_2_outlined,
                      ),
              SizedBox(height: 15),
              // Divider(),
              // buildInfoRow('Last Name', 'Mathlouthi'),
              // SizedBox(height: 10),
              // Divider(),
              CustomTextFormAuth(
                        valid: (val) {
                          return (validInput(val!, 7, 15, 'phone'));
                        },
                        isNumber: true,
                        mycontroller: controller.usersphone,
                        hinttext: "23".tr,
                        labeltext: "24".tr,
                        icondata: Icons.phone_android_outlined,
                      ),
              SizedBox(height: 15),
              // Divider(),
              CustomTextFormAuth(
                  valid: (val) {
                    return (validInput(val!, 5, 100, 'email'));
                  },
                  isNumber: false,
                  mycontroller: controller.usersemail,
                  hinttext: "12".tr,
                  labeltext: "12".tr,
                  icondata: Icons.email_outlined,
                ),
              const SizedBox(height: 30),
                  
                    
                      ElevatedButton(
                                      onPressed: () {
                      controller.editUser();
                      Setcontroller.refreshData();
                                      },
                                      // icon: Icon(Icons.logout, color: Colors.white),
                                      child: Text('update'),
                                      style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Appcolor.pink,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      ),
                                    ),
                    
                  
            ],
                    ),
                  ),
                ),
                
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                onPressed: () {
                  controller.logout();
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text('Log out'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              )],
              ),
            ),
          ),
        ),
      )));
    
  }
}

