/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/controller/home_controller.dart';
import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/functions/uploadfile.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/categories_data.dart';
import 'package:event_project/data/datasource/remote/events/addevent_data.dart';
import 'package:event_project/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventscontroller extends GetxController {
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
  // late TextEditingController eventTableid;
  

  File? file;

  chooseImage() async{

    file = await fileUploadGallery();
    update() ;

  }

    MyServices myServices = Get.find();


  StatusRequest statusRequest = StatusRequest.none;

  AddEventData addEventData = AddEventData(Get.find());
  // AddEventDataTwo addEventDataTwo = AddEventDataTwo(Get.find());
  GetCategoriesData getCategoriesData = GetCategoriesData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List data = [];
  List<CategoriesModel> categories = [];
  int? selectedCategoryId;
  
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
    if (selectedCategoryId == null) {
      Get.snackbar("Error", "Event Category ID is empty");
      return false;
    }
    
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
    if (file == null) {
      Get.snackbar("Error", "Event Image is not chosen");
      return false;
    }
    return true;
  }

  addEvent() async {
    if (!validateInputs()) {
      return;
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await addEventData.postdata(
      eventname.text,
      eventnamear.text,
      eventnamefr.text,
      eventdesc.text,
      eventdescar.text,
      eventdescfr.text,
      // eventImageFile?.path ?? '',
      eventimage.text,
      // file,
      int.parse(eventcount.text),
      // int.parse(eventactive.text),  
      int.parse(eventprice.text),
      int.parse(eventdiscount.text),
      eventdate.text,
      // int.parse(eventcat.text),
      selectedCategoryId!,
      eventlocation.text,
      eventphone.text,
      eventemail.text,
      file!,
      myServices.sharedpreferences.getString("id")!
      );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.susccess) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        HomeControllerImp c = Get.find();
        c.getData();
        // Get.defaultDialog(
        //     backgroundColor: Appcolor.bkcolor,
        //     titleStyle: const TextStyle(color: Colors.white),
        //     middleTextStyle: const TextStyle(color: Colors.white),
        //     title: "38".tr,
        //     middleText: "39".tr);
      } else {
        // Get.defaultDialog(
        //     // backgroundColor: Appcolor.bkcolor,
        //     titleStyle: const TextStyle(color: Colors.white),
        //     middleTextStyle: const TextStyle(color: Colors.white),
        //     title: "40".tr,
        //     middleText: "41".tr);
        statusRequest = StatusRequest.failure;
      }

      update();
    } else {}
  }


// addEvent2() async {
//     if (!validateInputs()) {
//       return;
//     }
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await addEventData.postdata(
//       eventname.text,
//       eventnamear.text,
//       eventnamefr.text,
//       eventdesc.text,
//       eventdescar.text,
//       eventdescfr.text,
//       // eventImageFile?.path ?? '',
//       eventimage.text,
//       // file,
//       int.parse(eventcount.text),
//       // int.parse(eventactive.text),
//       int.parse(eventprice.text),
//       int.parse(eventdiscount.text),
//       eventdate.text,
//       // int.parse(eventcat.text),
//       selectedCategoryId!,
//       eventlocation.text,
//       eventphone.text,
//       eventemail.text,
//       file!,
//       myServices.sharedpreferences.getString("id")!,
//       // eventTableid.text
      
//     );
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (statusRequest == StatusRequest.susccess) {
//       if (response['status'] == "success") {
//         // Get.offAllNamed(AppRoute.homepage);
//         // HomeControllerImp c = Get.find();
//         // c.getData();
//         Get.defaultDialog(
//             backgroundColor: Appcolor.bkcolor,
//             titleStyle: const TextStyle(color: Colors.white),
//             middleTextStyle: const TextStyle(color: Colors.white),
//             title: "38".tr,
//             middleText: "event added succefully".tr);
//       } else {
//         // Get.defaultDialog(
//         //     // backgroundColor: Appcolor.bkcolor,
//         //     titleStyle: const TextStyle(color: Colors.white),
//         //     middleTextStyle: const TextStyle(color: Colors.white),
//         //     title: "40".tr,
//         //     middleText: "41".tr);
//         statusRequest = StatusRequest.failure;
//       }

//       update();
//     } else {}
//   }



  // goToSignIn() {
  //   Get.offNamed(AppRoute.login);
  // }

  @override
  void onInit() {
    eventname = TextEditingController();
    eventnamear = TextEditingController();
    eventnamefr = TextEditingController();
    eventdesc = TextEditingController();
    eventdescar = TextEditingController();
    eventdescfr = TextEditingController();
    eventimage = TextEditingController();
    eventcount = TextEditingController();
    // eventactive = TextEditingController();
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
    super.onInit();
  }

  @override
  void dispose() {
    eventname.dispose();
    eventnamear.dispose();
    eventnamefr.dispose();
    eventdesc.dispose();
    eventdescar.dispose();
    eventdescfr.dispose();
    eventimage.dispose();
    eventcount.dispose();
    // eventactive.dispose();
    eventprice.dispose();
    eventdiscount.dispose();
    eventdate.dispose();
    eventcat.dispose();
    eventlocation.dispose();
    eventphone.dispose();
    eventemail.dispose();
    super.dispose();
  }
}


