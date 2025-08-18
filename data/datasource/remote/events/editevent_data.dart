/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:event_project/core/class/crud.dart';
import 'package:event_project/linkapi.dart';

class EditEventData {
  Crud crud;
  EditEventData(this.crud);

  Future<dynamic> postdata(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.eventUsersEdit, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.eventUsersEdit, data, file);
    }
    // Ensure that response is returned, even if it's null
    return response?.fold((l) => l, (r) => r) ?? {'status': 'error', 'message': 'No response from server'};
  }
}
