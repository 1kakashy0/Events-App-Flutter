/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************



import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  
  getData(String userid) async {
    var response = await crud.postData(AppLink.archiveOrders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}