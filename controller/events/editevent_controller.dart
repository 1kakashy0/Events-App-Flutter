/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/controller/events/eventview_controller.dart';
import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/uploadfile.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/categories_data.dart';
import 'package:event_project/data/datasource/remote/events/editevent_data.dart';
import 'package:event_project/data/model/categoriesmodel.dart';
import 'package:event_project/data/model/users_eventsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEventscontroller extends GetxController {
  late TextEditingController eventname;
  late TextEditingController eventnamear;
  late TextEditingController eventnamefr;
  late TextEditingController eventdesc;
  late TextEditingController eventdescar;
  late TextEditingController eventdescfr;
  late TextEditingController eventimage;
  late TextEditingController eventcount;
  // late TextEditingController eventactive;
  late TextEditingController eventprice;
  late TextEditingController eventdiscount;
  late TextEditingController eventdate;
  late TextEditingController eventcat;
  late TextEditingController eventlocation;
  late TextEditingController eventphone;
  late TextEditingController eventemail;    
  // String? eventsid ;
  // String? eventsid2 ;
  File? file;



  // void setEventIds(String id1, String id2) {
  //   eventsid = id1;
  //   eventsid2 = id2;
  // }


  

  void chooseImage() async {
    file = await fileUploadGallery();
    update();
  }

  UsersEventsModel? usersEventsModel ;

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  EditEventData editEventData = EditEventData(Get.find());
  GetCategoriesData getCategoriesData = GetCategoriesData(Get.find());
  List<CategoriesModel> categories = [];
  int? selectedCategoryId;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  void selectCategory(int categoryId) {
    selectedCategoryId = categoryId;
    update();
  }

  bool validateInputs() {
    if (eventname.text.isEmpty) {
      Get.snackbar("Error", "Event Name (EN) is empty");
      return false;
    }
    if (eventnamear.text.isEmpty) {
      Get.snackbar("Error", "Event Name (AR) is empty");
      return false;
    }
    if (eventnamefr.text.isEmpty) {
      Get.snackbar("Error", "Event Name (FR) is empty");
      return false;
    }
    if (eventdesc.text.isEmpty) {
      Get.snackbar("Error", "Event Description (EN) is empty");
      return false;
    }
    if (eventdescar.text.isEmpty) {
      Get.snackbar("Error", "Event Description (AR) is empty");
      return false;
    }
    if (eventdescfr.text.isEmpty) {
      Get.snackbar("Error", "Event Description (FR) is empty");
      return false;
    }
    if (eventcount.text.isEmpty) {
      Get.snackbar("Error", "Event Count is empty");
      return false;
    }
    // if (eventactive.text.isEmpty) {
    //   Get.snackbar("Error", "Event Active is empty");
    //   return false;
    // }
    if (eventprice.text.isEmpty) {
      Get.snackbar("Error", "Event Price is empty");
      return false;
    }
    if (eventdiscount.text.isEmpty) {
      Get.snackbar("Error", "Event Discount is empty");
      return false;
    }
    if (eventdate.text.isEmpty) {
      Get.snackbar("Error", "Event Date is empty");
      return false;
    }
    // if (selectedCategoryId == null) {
    //   Get.snackbar("Error", "Event Category ID is empty");
    //   return false;
    // }
    
    if (eventlocation.text.isEmpty) {
      Get.snackbar("Error", "Event Location is empty");
      return false;
    }
    if (eventphone.text.isEmpty) {
      Get.snackbar("Error", "Event Phone is empty");
      return false;
    }
    if (eventemail.text.isEmpty) {
      Get.snackbar("Error", "Event Email is empty");
      return false;
    }
    // if (file == null) {
    //   Get.snackbar("Error", "Event Image is not chosen");
    //   return false;
    // }
    return true;
  }

editEvent() async {
  if (!validateInputs()) {
      return;
    }
  statusRequest = StatusRequest.loading;
  update();

  Map<String, String> data = {
    "event_name": eventname.text,
    "event_name_ar": eventnamear.text,
    "event_name_fr": eventnamefr.text,
    "event_desc": eventdesc.text,
    "event_desc_ar": eventdescar.text,
    "event_desc_fr": eventdescfr.text,
    "event_image": eventimage.text,
    "event_count": eventcount.text,
    "event_price": eventprice.text,
    "event_discount": eventdiscount.text,
    "event_date": eventdate.text,
    "event_cat": eventcat.text,
    "event_location": eventlocation.text,
    "event_phone_number": eventphone.text,
    "event_email": eventemail.text,
    "event_id": usersEventsModel!.eventId!.toString(),
    "eventtable_id": usersEventsModel!.eventTableid!.toString(),
    "imageold" : usersEventsModel!.eventImage!
  };

  var response = await editEventData.postdata(data, file);

  if (response == null || response['status'] == 'error') {
    // Handle null or error response
    statusRequest = StatusRequest.failure;
    update();
    return;
  }

  if (response['status'] == "success") {
    // Get.toNamed(AppRoute.eventsView);
    // EventUsersViewController c = Get.find();
    // c.getEvents();
    statusRequest = StatusRequest.susccess;
  } else {
    statusRequest = StatusRequest.failure;
  }

  update();

}


goToEventsView(){
  Get.offNamed(AppRoute.eventsView);
  EventUsersViewController c = Get.find();
  c.getEvents();
}


  // editEvent() async {

  //   statusRequest = StatusRequest.loading;
  //   update();
  //   Map data =
  //     {
  //     "event_name": eventname.text,
  //     "event_name_ar": eventnamear.text,
  //     "event_name_fr": eventnamefr.text,
  //     "event_desc": eventdesc.text,
  //     "event_desc_ar": eventdescar.text,
  //     "event_desc_fr": eventdescfr.text,
  //     "event_image": eventimage.text,
  //     "event_count": eventcount.text,
  //     "event_price": eventprice.text,
  //     "event_discount": eventdiscount.text,
  //     "event_date": eventdate.text,
  //     "event_cat": eventcat.text,
  //     "event_location": eventlocation.text,
  //     "event_phone_number": eventphone.text,
  //     "event_email": eventemail.text,
  //     // "events_users_id": eventsid,
  //     "event_id": usersEventsModel!.eventId!.toString(),
  //     "eventtable_id": usersEventsModel!.eventTableid!.toString(),
  //   };
  //   var response = await editEventData.postdata(
  //   data , file
  //   );

  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.susccess) {
  //     if (response['status'] == "success") {
  //       Get.offNamed(AppRoute.eventsView);
  //       EventUsersViewController c = Get.find();
  //       c.getEvents();
  //       // Get.defaultDialog(
  //       //     backgroundColor: Appcolor.bkcolor,
  //       //     titleStyle: const TextStyle(color: Colors.white),
  //       //     middleTextStyle: const TextStyle(color: Colors.white),
  //       //     title: "38".tr,
  //       //     middleText: "39".tr);
  //     } else {
  //       // Get.defaultDialog(
  //       //     // backgroundColor: Appcolor.bkcolor,
  //       //     titleStyle: const TextStyle(color: Colors.white),
  //       //     middleTextStyle: const TextStyle(color: Colors.white),
  //       //     title: "40".tr,
  //       //     middleText: "41".tr);
  //       statusRequest = StatusRequest.failure;
  //     }
  //     update();
  //   }
    
  // }

  @override
  void onInit() {
    usersEventsModel = Get.arguments['usersEventsModel'];
    eventname = TextEditingController();
    eventnamear = TextEditingController();
    eventnamefr = TextEditingController();
    eventdesc = TextEditingController();
    eventdescar = TextEditingController();
    eventdescfr = TextEditingController();
    eventimage = TextEditingController();
    eventcount = TextEditingController();
    eventprice = TextEditingController();
    eventdiscount = TextEditingController();
    eventdate = TextEditingController();
    eventcat = TextEditingController();
    eventlocation = TextEditingController();
    eventphone = TextEditingController();
    eventemail = TextEditingController();
    getCategoriesData.getdata().then((value) {
      categories = value;
    });
    eventname.text = usersEventsModel!.eventName!;
    eventnamear.text = usersEventsModel!.eventNameAr!;
    eventnamefr.text = usersEventsModel!.eventNameFr!;
    eventdesc.text = usersEventsModel!.eventDesc!;
    eventdescar.text = usersEventsModel!.eventDescAr!;
    eventdescfr.text = usersEventsModel!.eventDescFr!;
    eventimage.text = usersEventsModel!.eventImage!;
    eventcount.text = usersEventsModel!.eventCount!.toString();
    // eventactive.text = usersEventsModel!.isActive!.toString()!;
    eventprice.text = usersEventsModel!.eventPrice!.toString();
    eventdiscount.text = usersEventsModel!.eventDiscount!.toString();
    eventdate.text = usersEventsModel!.eventDate!.toString();
    eventcat.text = usersEventsModel!.eventCat.toString();
    eventlocation.text = usersEventsModel!.eventLocation!;
    eventphone.text = usersEventsModel!.eventPhoneNumber!;
    eventemail.text = usersEventsModel!.eventEmail!;
    super.onInit();
    // final arguments = Get.arguments as Map<String, String>;
    // setEventIds(arguments['eventsid']!, arguments['eventsid2']!);
    // Other initialization code if necessary
  }
  }





