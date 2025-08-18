/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************



import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class UsersEventsData {
  Crud crud;
  UsersEventsData(this.crud);
  
  deleteEvent(String usersid, String eventsid , String eventsid2) async {
    var response = await crud
        .postData(AppLink.eventUsersDelete, {"events_users_id": usersid, "event_id": eventsid , "eventtable_id" : eventsid2});
    return response.fold((l) => l, (r) => r);
  }

  // deleteEvent2(String eventsid2) async {
  //   var response = await crud
  //       .postData(AppLink.eventUsersDelete, {"event_id": eventsid2});
  //   return response.fold((l) => l, (r) => r);
  // }

  getData(String userid) async {
    var response = await crud.postData(AppLink.eventUsersView, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}