/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class UsersData {
  Crud crud;

  UsersData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.usersView, {"id" : usersid });
    return response.fold((l) => l, (r) => r);
  }

  // updateData(String usersid, Map<String, dynamic> data) async {
  //   var response = await crud.putData(AppLink.usersView, {"id" : usersid }, data);
  //   return response.fold((l) => l, (r) => r);
  // }

  Future<dynamic> editdata(Map data) async {
    var response;
      response = await crud.postData(AppLink.usersEdit, data);
    // Ensure that response is returned, even if it's null
    return response?.fold((l) => l, (r) => r) ?? {'status': 'error', 'message': 'No response from server'};
  }
}