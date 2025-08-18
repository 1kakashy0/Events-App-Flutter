/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.homepage, {"usersid" : usersid});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search" : search});
    return response.fold((l) => l, (r) => r);
  }
}