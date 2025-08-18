/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/checkout_data.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  // AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  // String? deliveryType;
  // String? addressid;

  late String priceorders ;

  // List<AddressModel> dataaddress = [];

  // choosePaymentMethod(String val) {
  //   paymentMethod = val;
  //   update();
  // }

  // chooseDeliveryType(String val) {
  //   deliveryType = val;
  //   update();
  // }

  // chooseShippingAddress(String val) {
  //   addressid = val;
  //   update();
  // }

  // getShippingAddress() async {
  //   statusRequest = StatusRequest.loading;

  //   var response = await addressData
  //       .getData(myServices.sharedpreferences.getString("id")!);

  //   print("=============================== Controller $response ");

  //   statusRequest = handlingData(response);

  //   if (StatusRequest.susccess == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       List listdata = response['data'];
  //       dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

    checkout() async {
    // if (paymentMethod == null) {
    //   return Get.snackbar("Error", "Please select a payment method");
    // }
    // if (deliveryType == null) {
    //   return Get.snackbar("Error", "Please select a order Type");
    // }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedpreferences.getString("id"),
      // "addressid": addressid.toString(),
      // "orderstype": deliveryType.toString(),
      // "pricedelivery": "10",
      "ordersprice": priceorders,
      // "couponid": couponid,
      // "coupondiscount" : coupondiscount.toString() , 
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Try Again");
      }
      // End
    }
    update();
  }


  @override
  void onInit() {
    priceorders = Get.arguments['priceorder'] ;
    // getShippingAddress();
    super.onInit();
  }
}