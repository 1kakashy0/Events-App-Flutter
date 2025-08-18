/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class EventsData {
  Crud crud;

  EventsData(this.crud);

  getData(String id , String usersid) async {
    var response = await crud.postData(AppLink.eventpage, {"id" : id.toString() , "usersid" : usersid });
    return response.fold((l) => l, (r) => r);
  }
}