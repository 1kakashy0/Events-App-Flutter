/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class AddEventData {
  Crud crud;
  AddEventData(this.crud);
  postdata(
    String eventname,
    String eventnamear,
    String eventnamefr,
    String eventdesc,
    String eventdescar,
    String eventdescfr,
    String eventimage,
    int eventcount,
    // int eventactive,
    int eventprice,
    int eventdiscount,
    String eventdate,
    int eventcat,
    String eventlocation,
    String eventphone,
    String eventemail,
    File file,
    String usersid,
  ) async {
    var response = await crud.addRequestWithImageOne(AppLink.eventUsersAdd, {
      "event_name": eventname,
      "event_name_ar": eventnamear,
      "event_name_fr": eventnamefr,
      "event_desc": eventdesc,
      "event_desc_ar": eventdescar,
      "event_desc_fr": eventdescfr,
      "event_image": eventimage,
      "event_count": eventcount,
      // "event_active": eventactive,
      "event_price": eventprice,
      "event_discount": eventdiscount,
      "event_date": eventdate,
      "event_cat": eventcat,
      "event_location": eventlocation,
      "event_phone_number": eventphone,
      "event_email": eventemail,
      "events_users_id": usersid
    } , file);
    return response.fold((l) => l, (r) => r);
  }
}

