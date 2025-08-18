/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/myfavorite_data.dart';
import 'package:event_project/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {

  int currentpage = 0 ;

  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();


//  key => id items
//  Value => 1 OR 0




  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData.getData(
        myServices.sharedpreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'] ;
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e))) ;
        print("data") ;
        print(data) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update() ;
  }

  deleteFromFavorite(String favoriteid) {
    // data.clear();
    var response =  myfavoriteData.deleteData(
        favoriteid
        );
        data.removeWhere((element) => element.favoriteId.toString() == favoriteid) ;
    update() ;
  }

  changepage(int i) {
    currentpage = i ;
    update();
  }

  
  @override
  void onInit() {
    getData() ;
    super.onInit();
  }

  
}