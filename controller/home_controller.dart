/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/home_data.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController{
initialData();
getData();
goToEvents(List categories , int selectedCat , String categoryid);
goToPageProductDetails(EventsModel eventsModel);
refreshData();
}


class HomeControllerImp extends HomeController {


  MyServices myServices = Get.find() ;

  String? username ;
  String? id ;
  String? lang ;


  HomeData homeData = HomeData(Get.find());



  

  List data = [];
  List categories = [];
  List events = [];
  List texts = [];

  // bool refreshData = true; 
  


@override
  initialData() {
      lang = myServices.sharedpreferences.getString("lang") ;
      username = myServices.sharedpreferences.getString("username") ;
      id = myServices.sharedpreferences.getString("id") ;
  }

@override
  getData() async {
    data.clear();
    events.clear();
    categories.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData(myServices.sharedpreferences.getString("id")!); 
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      if (response['status'] == "success"){
      categories.addAll(response['categories']['data']);
      events.addAll(response['events']['data']);
      texts.addAll(response['texts']['data']);
    }else {
      statusRequest = StatusRequest.failure;
    }
  }
    update();
  }

 

  @override
  void onInit() {
    search = TextEditingController() ;
    initialData();
    getData();
    super.onInit();
  }
  
  @override
  goToEvents(categories , selectedCat , categoryid) {
    Get.toNamed(AppRoute.eventspage , arguments: {
      "categories" : categories ,
      "selectedCat" : selectedCat,
      "catid" : categoryid
    });
  }

  goToPageProductDetails(eventsModel) {
    Get.toNamed("productdetails", arguments: {"eventsmodel": eventsModel});
  }

  @override
  void refreshData() {
    getData(); // Re-fetch the data
  }
  
}

class SearchMixController extends GetxController{
    List<EventsModel> listdata = [];
    late StatusRequest statusRequest;



  HomeData homeData = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => EventsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchEvents() {
    isSearch = true;
    searchData();
    update();
  }

  

}