/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************



import 'package:event_project/core/class/statusrequest.dart';
import 'package:event_project/core/functions/handlingdatacontroller.dart';
import 'package:event_project/core/services/services.dart';
import 'package:event_project/data/datasource/remote/event_data.dart';
import 'package:event_project/data/datasource/remote/home_data.dart';
import 'package:event_project/data/model/eventsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EventsController extends GetxController{

initialData ();
changeCat (int val , String catval) ;
getEvents (String categoryid) ;
goToPageProductDetails(EventsModel eventsmodel) ; 
}

class EventsControllerImp extends SearchMixController{

  EventsData eventsData = EventsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
  
  MyServices myServices = Get.find() ;

  List categories = [];
  String? catid ;
  int? selectedCat ;

  @override
  void onInit() {
    search = TextEditingController() ;
    initialData() ;
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'] ;
    selectedCat = Get.arguments['selectedCat'] ;
    catid = Get.arguments['catid'] ;
    getEvents(catid!) ;
  }


  
  @override
  changeCat(val , catval) {
    selectedCat = val ;
    catid = catval ;
    getEvents(catid!) ;
    update() ;
  }
  
  @override
  getEvents(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await eventsData.getData(categoryid , myServices.sharedpreferences.getString("id")! );
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.susccess == statusRequest) {
      if (response['status'] == "success"){
      data.addAll(response['data']);
    }else {
      statusRequest = StatusRequest.failure;
    }
    }
    update();
  }
  
  @override
  goToPageProductDetails(eventsmodel) {
    Get.toNamed("productdetails" , arguments: {
      "eventsmodel" : eventsmodel
    }) ;
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