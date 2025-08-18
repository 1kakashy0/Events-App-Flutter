/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/cart_data.dart';
import 'package:event_project/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  String? countevents  = "0"  ;

  String? priceorders  = "0"  ;
  String? eventsid   ;

  String?  totalcountevents = "0"  ;

  goToPageCheckout(){
    if (data.isEmpty) return Get.snackbar("Alert!", "Empty Cart") ;
    Get.toNamed(AppRoute.checkout , arguments: {
      "priceorder" : priceorders.toString() ,
    }) ;
  }

  add(String eventsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("Event has been added to the cart"));
        // data.addAll(response['data']);
      } else {
        Get.rawSnackbar(
            title: "Alert!",
            messageText: const Text("You have already bought the maximum number of tickets for this event"));
        // statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String eventsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedpreferences.getString("id")!, eventsid.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

 

  resetVarCart() {
    totalcountevents = "0";
    priceorders = "0";
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedpreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountevents = (dataresponsecountprice['totalcount'].toString());
          priceorders = (dataresponsecountprice['totalprice'].toString());
          print(priceorders);
          }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}