/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  
  addCart(String usersid, String eventsid) async {
    var response = await crud
        .postData(AppLink.cartAdd, {"usersid": usersid, "eventsid": eventsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String eventsid) async {
    var response = await crud
        .postData(AppLink.cartRemove, {"usersid": usersid, "eventsid": eventsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String eventsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountevents, {"usersid": usersid, "eventsid": eventsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}